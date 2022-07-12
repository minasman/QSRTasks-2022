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
    #logic to notify all email & text when points are redeemed
    @user = User.find(params[:id])
    @reward = Reward.find(params[:reward_id])
    @user.accumulated_points = @user.accumulated_points - normalize_value(@user, @reward.value)
    rewards = @user.rewards
    rewards.push(@reward.id)
    @user.rewards = rewards
    @user.save
    redirect_to "/rewards/claim_my_reward/#{@user.id}}", allow_other_host: true, notice: "Congrats! You redeemed a #{@reward.name }. Your Supervisor or HR Manager will bring your reward! Thank You for All you do!"
  end

  def pending_to_redeem
    # Need to add functionality in the view to move rewards to redeemed_rewards in the users file
    @users_with_rewards_pending = User.where.not('rewards = ?', '{}')
    @users_with_rewards_pending = @users_with_rewards_pending.search(params[:query]) if params[:query].present?
    @pagy, @users_with_rewards_pending = pagy @users_with_rewards_pending.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
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
      my_points = @user.accumulated_points.to_i
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

    def normalize_value(user, value)
      position = user.position.name
      if position in ["Crew", "Manager"]
        value
      elsif position == "General Manager"
        value = value * 5
      elsif position == "Supervisor"
        value = value * 10
      elsif position == "Operations Manager"
        value = value * 15
      elsif position == "Director"
        value = value * 30
      else
        value
      end
    end


  def sort_column
    %w{ first_name }.include?(params[:sort]) ? params[:sort] : "first_name"
  end

  def sort_direction
    %w{ asc desc }.include?(params[:direction]) ? params[:direction] : "asc"
  end

end
