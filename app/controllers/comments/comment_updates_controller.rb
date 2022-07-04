class Comments::CommentUpdatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: %w[new create]

  # GET /comment_updates or /comment_updates.json
  def index
    @comment_updates = CommentUpdate.all
  end

  # GET /comment_updates/1 or /comment_updates/1.json
  def show
  end

  # GET /comment_updates/new
  def new
    @comment.comment_updates.build
  end

  # GET /comment_updates/1/edit
  def edit
  end

  # POST /comment_updates or /comment_updates.json
  def create
    params[:comment_update][:user_id] = current_user.id
    params[:comment_update][:update_time] = Time.now
    @comment.comment_updates.create(comment_params)
    flash.notice = 'Comment Update Successfully Added'
    if params[:comment_update][:status] && params[:comment_update][:status] == 'Closed'
      @comment.status = 'Closed'
      @comment.save
    end
    redirect_to comment_path(@comment, alert: 'alert alert-success')
  end

  # PATCH/PUT /comment_updates/1 or /comment_updates/1.json
  def update
    respond_to do |format|
      if @comment_update.update(comment_update_params)
        format.html { redirect_to comment_update_url(@comment_update), notice: "Comment Update Successfully Added" }
        format.json { render :show, status: :ok, location: @comment_update }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comment_updates/1 or /comment_updates/1.json
  def destroy
    @comment_update.destroy

    respond_to do |format|
      format.html { redirect_to comment_updates_url, notice: "Comment update was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:comment_id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment_update).permit(:update_date, :update_time, :update_type, :current_update, :employee_name, :comment_id, :user_id)
    end
end
