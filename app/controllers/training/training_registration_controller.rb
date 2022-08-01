class Training::TrainingRegistrationController < ApplicationController
  before_action :authenticate_user!

  def show

  end

  def new
    @training_registration = User.find(params[:id])
    @curriculum = Curriculum.where(start_date: Date.today..Date.today+1.year).order(name: :asc, start_date: :asc)
    @tclasses = []
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def get_classes
    @training_registration = User.find(params[:id])
    @curriculum = Curriculum.find(params[:curriculum])
    @c_id = params[:curriculum]
    @c = Curriculum.where(start_date: Date.today-2.months..Date.today+1.year).order(name: :asc, start_date: :asc)
    @tclasses = @curriculum.tclasses
    @target = params[:target]
    respond_to do |format|
      format.turbo_stream
    end
  end

  def register
    @training_registration = User.find(params[:id])
    existing_classes = @training_registration.tclasses.ids
    tclasses = params[:tclass_ids]
    tclasses.each do |t|
      existing_classes.push(t)
    end
    existing_classes.uniq
    respond_to do |format|
      if @training_registration.update(tclass_ids: existing_classes)
        format.html { redirect_to user_path(@training_registration), notice: "#{tclasses.size - 1} Training Classes Added!!" }
        format.json { render :show, status: :ok, location: @training_registration }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @training_registration.errors, status: :unprocessable_entity }
      end
    end

  end

end
