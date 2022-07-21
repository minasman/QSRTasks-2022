require "application_system_test_case"

class ShopsTest < ApplicationSystemTestCase
  setup do
    @shop = shops(:one)
  end

  test "visiting the index" do
    visit shops_url
    assert_selector "h1", text: "Shops"
  end

  test "should create shop" do
    visit shops_url
    click_on "New shop"

    fill_in "Accuracycomment", with: @shop.accuracyComment
    fill_in "Achievedpoints", with: @shop.achievedPoints
    fill_in "Buntimer", with: @shop.bunTimer
    fill_in "Cashierask", with: @shop.cashierAsk
    fill_in "Cashiergreeting", with: @shop.cashierGreeting
    fill_in "Cashiername", with: @shop.cashierName
    fill_in "Cashierround", with: @shop.cashierRound
    fill_in "Cleancomment", with: @shop.cleanComment
    fill_in "Codclean", with: @shop.codClean
    fill_in "Codgum", with: @shop.codGum
    fill_in "Commentsignvisible", with: @shop.commentSignVisible
    fill_in "Completeorder", with: @shop.completeOrder
    fill_in "Condiment", with: @shop.condiment
    fill_in "Condimentbag", with: @shop.condimentBag
    fill_in "Contactless", with: @shop.contactless
    fill_in "Corralclean", with: @shop.corralClean
    fill_in "Crewappearance", with: @shop.crewAppearance
    fill_in "Crewroom", with: @shop.crewRoom
    fill_in "Csppe", with: @shop.csPPE
    check "Docrequired" if @shop.docRequired
    fill_in "Drinkclean", with: @shop.drinkClean
    fill_in "Drinkgood", with: @shop.drinkGood
    fill_in "Dtclean", with: @shop.dtClean
    fill_in "Dtcommentnumber", with: @shop.dtCommentNumber
    fill_in "Dtglassclean", with: @shop.dtGlassClean
    fill_in "Dtgum", with: @shop.dtGum
    fill_in "Fastcomment", with: @shop.fastComment
    fill_in "Fcdeliverytime", with: @shop.fcDeliveryTime
    fill_in "Fctotaltime", with: @shop.fcTotalTime
    fill_in "Fcwaittime", with: @shop.fcWaitTime
    fill_in "Floorclean", with: @shop.floorClean
    fill_in "Folded", with: @shop.folded
    fill_in "Foodsafetycomment", with: @shop.foodSafetyComment
    fill_in "Fresh", with: @shop.fresh
    fill_in "Friesgood", with: @shop.friesGood
    fill_in "Glove", with: @shop.glove
    fill_in "Headset", with: @shop.headset
    fill_in "Hospitalitycomment", with: @shop.hospitalityComment
    fill_in "Insidetrash", with: @shop.insideTrash
    fill_in "Itemsordered", with: @shop.itemsOrdered
    fill_in "Kiosks", with: @shop.kiosks
    fill_in "Lidsclosed", with: @shop.lidsClosed
    fill_in "Lotclean", with: @shop.lotClean
    fill_in "Lotgum", with: @shop.lotGum
    fill_in "Loyalty", with: @shop.loyalty
    fill_in "Marketing", with: @shop.marketing
    fill_in "Mgrappearance", with: @shop.mgrAppearance
    fill_in "Numbercars", with: @shop.numberCars
    fill_in "Numberguests", with: @shop.numberGuests
    fill_in "Oeptime", with: @shop.oepTime
    fill_in "Organization", with: @shop.organization_id
    fill_in "Otname", with: @shop.otName
    fill_in "Otppe", with: @shop.otPPE
    fill_in "P2ppe", with: @shop.p2PPE
    fill_in "Pppe", with: @shop.pPPE
    fill_in "Pftell", with: @shop.pfTell
    fill_in "Pietimer", with: @shop.pieTimer
    fill_in "Possiblepoints", with: @shop.possiblePoints
    fill_in "Ppe", with: @shop.ppe
    fill_in "Preptimer", with: @shop.prepTimer
    fill_in "Presell", with: @shop.presell
    fill_in "Presenttime", with: @shop.presentTime
    fill_in "Presentergreet", with: @shop.presenterGreet
    fill_in "Presentername", with: @shop.presenterName
    fill_in "Presentertell", with: @shop.presenterTell
    fill_in "Promptcondiments", with: @shop.promptCondiments
    fill_in "Pullforward", with: @shop.pullForward
    fill_in "Pullforwardpresentername", with: @shop.pullForwardPresenterName
    fill_in "Pullforwardtime", with: @shop.pullForwardTime
    fill_in "Qtrcorrect", with: @shop.qtrCorrect
    fill_in "Qtrdate", with: @shop.qtrDate
    fill_in "Qtrtime", with: @shop.qtrTime
    fill_in "Qualitycomment", with: @shop.qualityComment
    fill_in "R2d2charts", with: @shop.r2d2Charts
    fill_in "Rdm", with: @shop.rdm
    fill_in "Readerboard", with: @shop.readerboard
    fill_in "Repeatorderask", with: @shop.repeatOrderAsk
    fill_in "Responsetime", with: @shop.responseTime
    fill_in "Restroomclean", with: @shop.restroomClean
    fill_in "Sanitizer", with: @shop.sanitizer
    fill_in "Score", with: @shop.score
    fill_in "Shiftmgrcomment", with: @shop.shiftMgrComment
    fill_in "Shopdate", with: @shop.shopDate
    fill_in "Shoptime", with: @shop.shopTime
    fill_in "Shoptype", with: @shop.shopType
    fill_in "Store", with: @shop.store_id
    fill_in "Tableclean", with: @shop.tableClean
    fill_in "Tableservice", with: @shop.tableService
    fill_in "Tabletent", with: @shop.tableTent
    fill_in "Tandem", with: @shop.tandem
    fill_in "Totaltime", with: @shop.totalTime
    fill_in "Trashfull", with: @shop.trashFull
    fill_in "Tvon", with: @shop.tvOn
    fill_in "Uhctimer", with: @shop.uhcTimer
    fill_in "Upfront", with: @shop.upFront
    fill_in "Upsell", with: @shop.upsell
    fill_in "Ventsclean", with: @shop.ventsClean
    fill_in "Waittime", with: @shop.waitTime
    fill_in "Windowsclean", with: @shop.windowsClean
    click_on "Create Shop"

    assert_text "Shop was successfully created"
    click_on "Back"
  end

  test "should update Shop" do
    visit shop_url(@shop)
    click_on "Edit this shop", match: :first

    fill_in "Accuracycomment", with: @shop.accuracyComment
    fill_in "Achievedpoints", with: @shop.achievedPoints
    fill_in "Buntimer", with: @shop.bunTimer
    fill_in "Cashierask", with: @shop.cashierAsk
    fill_in "Cashiergreeting", with: @shop.cashierGreeting
    fill_in "Cashiername", with: @shop.cashierName
    fill_in "Cashierround", with: @shop.cashierRound
    fill_in "Cleancomment", with: @shop.cleanComment
    fill_in "Codclean", with: @shop.codClean
    fill_in "Codgum", with: @shop.codGum
    fill_in "Commentsignvisible", with: @shop.commentSignVisible
    fill_in "Completeorder", with: @shop.completeOrder
    fill_in "Condiment", with: @shop.condiment
    fill_in "Condimentbag", with: @shop.condimentBag
    fill_in "Contactless", with: @shop.contactless
    fill_in "Corralclean", with: @shop.corralClean
    fill_in "Crewappearance", with: @shop.crewAppearance
    fill_in "Crewroom", with: @shop.crewRoom
    fill_in "Csppe", with: @shop.csPPE
    check "Docrequired" if @shop.docRequired
    fill_in "Drinkclean", with: @shop.drinkClean
    fill_in "Drinkgood", with: @shop.drinkGood
    fill_in "Dtclean", with: @shop.dtClean
    fill_in "Dtcommentnumber", with: @shop.dtCommentNumber
    fill_in "Dtglassclean", with: @shop.dtGlassClean
    fill_in "Dtgum", with: @shop.dtGum
    fill_in "Fastcomment", with: @shop.fastComment
    fill_in "Fcdeliverytime", with: @shop.fcDeliveryTime
    fill_in "Fctotaltime", with: @shop.fcTotalTime
    fill_in "Fcwaittime", with: @shop.fcWaitTime
    fill_in "Floorclean", with: @shop.floorClean
    fill_in "Folded", with: @shop.folded
    fill_in "Foodsafetycomment", with: @shop.foodSafetyComment
    fill_in "Fresh", with: @shop.fresh
    fill_in "Friesgood", with: @shop.friesGood
    fill_in "Glove", with: @shop.glove
    fill_in "Headset", with: @shop.headset
    fill_in "Hospitalitycomment", with: @shop.hospitalityComment
    fill_in "Insidetrash", with: @shop.insideTrash
    fill_in "Itemsordered", with: @shop.itemsOrdered
    fill_in "Kiosks", with: @shop.kiosks
    fill_in "Lidsclosed", with: @shop.lidsClosed
    fill_in "Lotclean", with: @shop.lotClean
    fill_in "Lotgum", with: @shop.lotGum
    fill_in "Loyalty", with: @shop.loyalty
    fill_in "Marketing", with: @shop.marketing
    fill_in "Mgrappearance", with: @shop.mgrAppearance
    fill_in "Numbercars", with: @shop.numberCars
    fill_in "Numberguests", with: @shop.numberGuests
    fill_in "Oeptime", with: @shop.oepTime
    fill_in "Organization", with: @shop.organization_id
    fill_in "Otname", with: @shop.otName
    fill_in "Otppe", with: @shop.otPPE
    fill_in "P2ppe", with: @shop.p2PPE
    fill_in "Pppe", with: @shop.pPPE
    fill_in "Pftell", with: @shop.pfTell
    fill_in "Pietimer", with: @shop.pieTimer
    fill_in "Possiblepoints", with: @shop.possiblePoints
    fill_in "Ppe", with: @shop.ppe
    fill_in "Preptimer", with: @shop.prepTimer
    fill_in "Presell", with: @shop.presell
    fill_in "Presenttime", with: @shop.presentTime
    fill_in "Presentergreet", with: @shop.presenterGreet
    fill_in "Presentername", with: @shop.presenterName
    fill_in "Presentertell", with: @shop.presenterTell
    fill_in "Promptcondiments", with: @shop.promptCondiments
    fill_in "Pullforward", with: @shop.pullForward
    fill_in "Pullforwardpresentername", with: @shop.pullForwardPresenterName
    fill_in "Pullforwardtime", with: @shop.pullForwardTime
    fill_in "Qtrcorrect", with: @shop.qtrCorrect
    fill_in "Qtrdate", with: @shop.qtrDate
    fill_in "Qtrtime", with: @shop.qtrTime
    fill_in "Qualitycomment", with: @shop.qualityComment
    fill_in "R2d2charts", with: @shop.r2d2Charts
    fill_in "Rdm", with: @shop.rdm
    fill_in "Readerboard", with: @shop.readerboard
    fill_in "Repeatorderask", with: @shop.repeatOrderAsk
    fill_in "Responsetime", with: @shop.responseTime
    fill_in "Restroomclean", with: @shop.restroomClean
    fill_in "Sanitizer", with: @shop.sanitizer
    fill_in "Score", with: @shop.score
    fill_in "Shiftmgrcomment", with: @shop.shiftMgrComment
    fill_in "Shopdate", with: @shop.shopDate
    fill_in "Shoptime", with: @shop.shopTime
    fill_in "Shoptype", with: @shop.shopType
    fill_in "Store", with: @shop.store_id
    fill_in "Tableclean", with: @shop.tableClean
    fill_in "Tableservice", with: @shop.tableService
    fill_in "Tabletent", with: @shop.tableTent
    fill_in "Tandem", with: @shop.tandem
    fill_in "Totaltime", with: @shop.totalTime
    fill_in "Trashfull", with: @shop.trashFull
    fill_in "Tvon", with: @shop.tvOn
    fill_in "Uhctimer", with: @shop.uhcTimer
    fill_in "Upfront", with: @shop.upFront
    fill_in "Upsell", with: @shop.upsell
    fill_in "Ventsclean", with: @shop.ventsClean
    fill_in "Waittime", with: @shop.waitTime
    fill_in "Windowsclean", with: @shop.windowsClean
    click_on "Update Shop"

    assert_text "Shop was successfully updated"
    click_on "Back"
  end

  test "should destroy Shop" do
    visit shop_url(@shop)
    click_on "Destroy this shop", match: :first

    assert_text "Shop was successfully destroyed"
  end
end
