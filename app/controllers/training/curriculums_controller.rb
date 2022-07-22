class Training::CurriculumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_curriculum, only: %i[ show edit update destroy ]

  # GET /curriculums or /curriculums.json
  def index
    @curriculums = Curriculum.is_current
    authorize Curriculum
  end

  # GET /curriculums/1 or /curriculums/1.json
  def show
    authorize @curriculum
  end

  # GET /curriculums/new
  def new
    @curriculum = Curriculum.new
    @curriculum.tclasses.new
    authorize @curriculum
  end

  # GET /curriculums/1/edit
  def edit
    authorize @curriculum
  end

  # POST /curriculums or /curriculums.json
  def create
    @curriculum = Curriculum.new(curriculum_params)
    authorize @curriculum
    @curriculum.organization = current_user.organization

    respond_to do |format|
      if @curriculum.save
        format.html { redirect_to curriculum_url(@curriculum), notice: "Curriculum was successfully created." }
        format.json { render :show, status: :created, location: @curriculum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /curriculums/1 or /curriculums/1.json
  def update
    authorize @curriculum
    respond_to do |format|
      if @curriculum.update(curriculum_params)
        format.html { redirect_to curriculum_url(@curriculum), notice: "Curriculum was successfully updated." }
        format.json { render :show, status: :ok, location: @curriculum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @curriculum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /curriculums/1 or /curriculums/1.json
  def destroy
    authorize @curriculum
    @curriculum.destroy

    respond_to do |format|
      format.html { redirect_to curriculums_url, notice: "Curriculum was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def schedule
    @tclasses = my_people
    @counter = 0
  end

  def my_schedule
    @tclasses = personal_schedule(params[:id])
    @counter = 0
    @user = User.find(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_curriculum
      @curriculum = Curriculum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def curriculum_params
      params.require(:curriculum).permit(:name, :start_date, :class_type, :organization_id, :current,tclasses_attributes: %i[name id duration instructor_id capacity location class_date class_time _destroy])
    end

    def my_people
      tclass_list = []
      Curriculum.order(start_date: :asc).is_current.each do |course|
        course.tclasses.order(class_date: :asc).each do |tclass|
          tclass.users.each do |user|
            if user.stores[0].in? current_user.stores
              tclass_list.push(tclass)
            end
          end
        end
      end
      tclass_list.uniq
    end

    def personal_schedule(student)
      tclass_list = []
      Curriculum.is_current.each do |course|
        course.tclasses.order(class_date: :asc).each do |tclass|
          tclass.users.each do |user|
            if user.id == student.to_i
              tclass_list.push(tclass)
            end
          end
        end
      end
      tclass_list.uniq
    end
end
