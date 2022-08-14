class Training::FoodHandlerCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_handler_card, only: %i[ show edit update destroy ]

  def index
    if params[:store_id]
      @food_handler_cards = FoodHandlerCard.where(store_id: params[:store_id])
    else
      @food_handler_cards = FoodHandlerCard.all
    end
    authorize FoodHandlerCard
  end

  def show
    authorize @food_handler_card
  end

  def new
    @food_handler_card = FoodHandlerCard.new
    @user = User.find(params[:id])
    authorize @food_handler_card
  end

  def edit
    @user = @food_handler_card.user
    authorize @food_handler_card
  end

  def create
    @food_handler_card = FoodHandlerCard.new(food_handler_card_params)
    authorize @food_handler_card
    @food_handler_card.organization = current_user.organization
    respond_to do |format|
      if @food_handler_card.save
        format.html { redirect_to user_path(@food_handler_card.user), notice: "ServSafe was successfully created." }
        format.json { render :show, status: :created, location: @food_handler_card }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @food_handler_card.errors, status: :unprocessable_entity }
      end
    end

  end

  def update
    authorize @food_handler_card
    respond_to do |format|
      if @food_handler_card.update(food_handler_card_params)
        format.html { redirect_to user_path(@food_handler_card.user), notice: "ServSafe was successfully updated." }
        format.json { render :show, status: :ok, location: @food_handler_card }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @food_handler_card.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    authorize @food_handler_card
  end

  private

  def set_food_handler_card
    @food_handler_card = FoodHandlerCard.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_handler_card_params
    params.require(:food_handler_card).permit(:organization_id, :store_id, :user_id, :issue_date, :expiration_date, :picture)
  end

end
