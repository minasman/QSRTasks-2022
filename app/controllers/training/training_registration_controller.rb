class Training::TrainingRegistrationController < ApplicationController
  before_action :authenticate_user!

  def new
    @student = User.find(params[:id])
    @curriculum = Curriculum.where(start_date: Date.today-2.months..Date.today+1.year).order(name: :asc, start_date: :asc)
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
    @curriculum = Curriculum.find(params[:curriculum])
    @tclasses = @curriculum.tclasses
    respond_to do |format|
      format.turbo_stream
    end
  end

  def register
    puts params[:classes]
  end

end
