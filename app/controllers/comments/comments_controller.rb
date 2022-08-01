class Comments::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = get_comments
    @comments = @comments.search(params[:query]) if params[:query].present?
    @pagy, @comments = pagy @comments.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
    authorize Comment
  end

  # GET /comments/1 or /comments/1.json
  def show
    authorize @comment
  end

  # GET /comments/new
  def new
    @comment = Comment.new
    @comment.build_guest
    authorize @comment
  end

  # GET /comments/1/edit
  def edit
    authorize @comment
  end

  # POST /comments or /comments.json
  def create
    @comment = Comment.new(comment_params)
    @comment.organization = current_user.organization
    @comment.guest.organization = current_user.organization
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comment_path(@comment), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_path(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    authorize @comment
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def ftks_comments
    @comment_count = {}
    Store.where(active: true, store_type: "Traditional").order(number: :asc).each do |store|
      list = []
      list.push(store.comments.where(visit_date: Time.now.beginning_of_week..Time.now, source: "1-800#", comment_type: "Complaint").size)
      list.push(store.comments.where(visit_date: Time.now.beginning_of_month..Time.now, source: "1-800#", comment_type: "Complaint").size)
      list.push(store.comments.where(visit_date: Time.now.beginning_of_quarter..Time.now, source: "1-800#", comment_type: "Complaint").size)
      list.push(store.comments.where(visit_date: Time.now.beginning_of_year..Time.now, source: "1-800#", comment_type: "Complaint").size)
      @comment_count["#{store.number}"] = list
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.fetch(:comment, {}).permit(:visit_date, :visit_time, :comment_type, :source, :urgent, :case_number, :first_issue, :first_issue_comment, :second_issue, :second_issue_comment, :third_issue, :third_issue_comment, :contact_type, :visit_type, :employee_named, :status, :guest_id, :store_id, :organization_id, guest_attributes: %i[first_name last_name phone email])
    end

    def get_comments
      if current_user.position.department.in? %w[Administration Maintenance Office]
        Comment.all.where(organization: current_user.organization, status: 'Open', comment_type: "Complaint").order(store_id: :asc, visit_date: :asc)
      else
        Comment.where(store_id: current_user.stores, status: 'Open', organization: current_user.organization, comment_type: "Complaint").order(store_id: :asc, visit_date: :asc)
      end
    end

    def sort_column
      %w{ store_id }.include?(params[:sort]) ? params[:sort] : "store_id"
    end

    def sort_direction
      %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
    end
end
