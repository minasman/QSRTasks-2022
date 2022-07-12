class Documentations::RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reward, only: %i[ show edit update destroy ]

  # GET /rewards or /rewards.json
  def index
    @rewards = Reward.all
  end

  # GET /rewards/1 or /rewards/1.json
  def show
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
  end

  # GET /rewards/1/edit
  def edit
  end

  # POST /rewards or /rewards.json
  def create
    @reward = Reward.new(reward_params)

    respond_to do |format|
      if @reward.save
        format.html { redirect_to reward_url(@reward), notice: "Reward was successfully created." }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1 or /rewards/1.json
  def update
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to reward_url(@reward), notice: "Reward was successfully updated." }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1 or /rewards/1.json
  def destroy
    @reward.destroy

    respond_to do |format|
      format.html { redirect_to rewards_url, notice: "Reward was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def claim_my_reward
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_url(current_user), alert: "You can only claim rewards for yourself"
    else
      my_points = normalize_points(@user)
      @rewards = Reward.where(value: 1..my_points)
    end
  end

  def redeem_points
    #logic to redeem selected reward, assign to user, notify all, add to pending list to distribute, adjust points for user
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reward
      @reward = Reward.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reward_params
      params.require(:reward).permit(:name, :value, :organization_id)
    end

    def normalize_points(user)
      my_points = @user.employee_named_documentations.sum(:points).to_i
      position = user.position.name
      if position in ["Crew", "Manager"]
        my_points
      elsif position == "General Manager"
        my_points = (my_points/10).to_i
      elsif position == "Supervisor"
        my_points = (my_points/10).to_i
      elsif position == "Operations Manager"
        my_points = (my_points/15).to_i
      elsif position == "Director"
        my_points = (my_points/30).to_i
      else
        my_points
      end
    end

end
