class Documentations::RewardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_reward, only: %i[ show edit update destroy ]

  # GET /rewards or /rewards.json
  def index
    @rewards = Reward.where(active: true)
    authorize Reward
  end

  # GET /rewards/1 or /rewards/1.json
  def show
    authorize @reward
  end

  # GET /rewards/new
  def new
    @reward = Reward.new
    authorize @reward
  end

  # GET /rewards/1/edit
  def edit
    authorize @reward
  end

  # POST /rewards or /rewards.json
  def create
    @reward = Reward.new(reward_params)
    authorize @reward
    @reward.organization = current_user.organization

    respond_to do |format|
      if @reward.save
        format.html { redirect_to reward_path(@reward), notice: "Reward was successfully created." }
        format.json { render :show, status: :created, location: @reward }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rewards/1 or /rewards/1.json
  def update
    authorize @reward
    respond_to do |format|
      if @reward.update(reward_params)
        format.html { redirect_to reward_path(@reward), notice: "Reward was successfully updated." }
        format.json { render :show, status: :ok, location: @reward }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rewards/1 or /rewards/1.json
  def destroy
    authorize @reward
    reward_id = "reward_#{@reward.id}"
    @reward.update(active: @reward.active ? false : true)
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(reward_id) }
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
    @users_with_rewards_pending = User.where.not('rewards = ?', '{}')
    @users_with_rewards_pending = @users_with_rewards_pending.search(params[:query]) if params[:query].present?
    @pagy, @users_with_rewards_pending = pagy @users_with_rewards_pending.reorder(sort_column => sort_direction), items: params.fetch(:count, 10)
  end

  def pay_out
    user = User.find(params[:id])
    rewards = user.rewards
    redeemed = user.redeemed_rewards
    rewards.delete_at(rewards.index(params[:reward].to_i))
    redeemed.push(params[:reward])
    user.update(rewards: rewards, redeemed_rewards: redeemed)
    redirect_to "/pending_to_redeem"
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
      my_points = user.accumulated_points
      position = user.position.name
      if position.in? ["Crew", "Manager", "AA", "Maint Admin", "Maint Tech", "OTP Tech", "Patch Maint", "HR Admin", "AR Admin", "AP Admin", "Marketing Admin", "Payroll Admin", "Shopper", "Training Assistant"]
        my_points
      elsif position.in? ["General Manager", "Marketing Manager", "Training Manager", "Payroll Manager", "AP Manager", "AR Manager", "HR Manager"]
        my_points = (my_points/3).to_i
      elsif position.in? ["Supervisor", "PM Department Head", "Maint Tech Department Head", "Technology Department Head"]
        my_points = (my_points/10).to_i
      elsif position.in? ["Operations Manager", "Maint Department Head"]
        my_points = (my_points/15).to_i
      elsif position.in? ["Director", "Business Director"]
        my_points = (my_points/30).to_i
      else
        my_points
      end
    end

    def normalize_value(user, value)
      position = user.position.name
      if position.in? ["Crew", "Manager", "AA", "Maint Admin", "Maint Tech", "OTP Tech", "Patch Maint", "HR Admin", "AR Admin", "AP Admin", "Marketing Admin", "Payroll Admin", "Shopper", "Training Assistant"]
        value
      elsif position.in? ["General Manager", "Marketing Manager", "Training Manager", "Payroll Manager", "AP Manager", "AR Manager", "HR Manager"]
        value = value * 3
      elsif position.in? ["Supervisor", "PM Department Head", "Maint Tech Department Head", "Technology Department Head"]
        value = value * 10
      elsif position.in? ["Operations Manager", "Maint Department Head"]
        value = value * 15
      elsif position.in? ["Director", "Business Director"]
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
