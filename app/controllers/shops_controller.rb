class ShopsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_shop, only: %i[ show edit update destroy ]

  # GET /shops or /shops.json
  def index
    @shops = Shop.where(store_id: current_user.stores)
    authorize Shop
  end

  # GET /shops/1 or /shops/1.json
  def show
    authorize @shop
  end

  # GET /shops/new
  def new
    @shop = Shop.new
    authorize @shop
  end

  # GET /shops/1/edit
  def edit
    authorize @shop
    if @shop.shopper != current_user
      respond_to do |format|
        format.html { redirect_to shop_url(@shop), alert: "You cannot edit an shop you did not generate" }
      end
    end
  end

  # POST /shops or /shops.json
  def create
    @shop = Shop.new(shop_params)
    authorize @shop
    @shop.organization = current_user.organization
    @shop.shopper = current_user
    if @shop.score.to_f < 70
      @shop.docRequired = true
    end
    respond_to do |format|
      if @shop.save
        ShopMailer.shop(@shop).deliver_later
        format.html { redirect_to shop_path(@shop), notice: "Shop was successfully created." }
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1 or /shops/1.json
  def update
    authorize @shop
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to shop_path(@shop), notice: "Shop was successfully updated." }
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1 or /shops/1.json
  def destroy
    authorize @shop
    @shop.destroy

    respond_to do |format|
      format.html { redirect_to shops_url, notice: "Shop was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def manager_list
    @target = params[:target]
    @ottarget = params[:ot]
    @cstarget = params[:cs]
    @ptarget = params[:p]
    @pftarget = params[:pf]
    store = Store.find(params[:store])
    @managers =  store.users.where(position_id: [5, 15], active: true).order(position_id: :desc, first_name: :asc)
    @crew = store.users.where(position_id: [5, 15, 26], active: true).order(position_id: :desc, first_name: :asc)
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def shop_params
      params.require(:shop).permit(:store_id, :organization_id, :shopDate, :shopTime, :shopType, :upFront, :mgrAppearance, :headset, :crewAppearance, :r2d2Charts, :rdm, :kiosks, :tableService, :tableTent, :shiftMgrComment, :fastComment, :qualityComment, :accuracyComment, :hospitalityComment, :cleanComment, :foodSafetyComment, :itemsOrdered, :waitTime, :responseTime, :presentTime, :oepTime, :totalTime, :pullForward, :pullForwardTime, :numberCars, :tandem, :fcWaitTime, :fcDeliveryTime, :fcTotalTime, :numberGuests, :completeOrder, :condiment, :condimentBag, :readerboard, :marketing, :dtCommentNumber, :presell, :upsell, :otName, :cashierName, :presenterName, :pullForwardPresenterName, :repeatOrderAsk, :cashierGreeting, :cashierAsk, :presenterGreet, :presenterTell, :pfTell, :fresh, :friesGood, :drinkGood, :codClean, :dtClean, :lotClean, :corralClean, :lidsClosed, :dtGlassClean, :windowsClean, :trashFull, :commentSignVisible, :floorClean, :tableClean, :drinkClean, :ventsClean, :sanitizer, :tvOn, :restroomClean, :insideTrash, :crewRoom, :uhcTimer, :prepTimer, :bunTimer, :qtrCorrect, :qtrDate, :qtrTime, :glove, :pieTimer, :ppe, :contactless, :lotGum, :codGum, :dtGum, :otPPE, :csPPE, :pPPE, :p2PPE, :folded, :cashierRound, :possiblePoints, :achievedPoints, :score, :promptCondiments, :docRequired, :loyalty, :curbsideTotalTime, :loyalty_name, :shiftName)
    end
end
