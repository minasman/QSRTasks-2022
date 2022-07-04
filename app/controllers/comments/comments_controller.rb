class Comments::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = get_comments
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
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully created." }
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
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
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
        Comment.all.where(organization: current_user.organization, status: 'Open').order(store_id: :asc, visit_date: :asc)
      else
        Comment.where(store_id: current_user.stores, status: 'Open', organization: current_user.organization).order(store_id: :asc, visit_date: :asc)
      end
    end
end
