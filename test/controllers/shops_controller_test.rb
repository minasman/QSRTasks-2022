require "test_helper"

class ShopsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shop = shops(:one)
  end

  test "should get index" do
    get shops_url
    assert_response :success
  end

  test "should get new" do
    get new_shop_url
    assert_response :success
  end

  test "should create shop" do
    assert_difference("Shop.count") do
      post shops_url, params: { shop: { accuracyComment: @shop.accuracyComment, achievedPoints: @shop.achievedPoints, bunTimer: @shop.bunTimer, cashierAsk: @shop.cashierAsk, cashierGreeting: @shop.cashierGreeting, cashierName: @shop.cashierName, cashierRound: @shop.cashierRound, cleanComment: @shop.cleanComment, codClean: @shop.codClean, codGum: @shop.codGum, commentSignVisible: @shop.commentSignVisible, completeOrder: @shop.completeOrder, condiment: @shop.condiment, condimentBag: @shop.condimentBag, contactless: @shop.contactless, corralClean: @shop.corralClean, crewAppearance: @shop.crewAppearance, crewRoom: @shop.crewRoom, csPPE: @shop.csPPE, docRequired: @shop.docRequired, drinkClean: @shop.drinkClean, drinkGood: @shop.drinkGood, dtClean: @shop.dtClean, dtCommentNumber: @shop.dtCommentNumber, dtGlassClean: @shop.dtGlassClean, dtGum: @shop.dtGum, fastComment: @shop.fastComment, fcDeliveryTime: @shop.fcDeliveryTime, fcTotalTime: @shop.fcTotalTime, fcWaitTime: @shop.fcWaitTime, floorClean: @shop.floorClean, folded: @shop.folded, foodSafetyComment: @shop.foodSafetyComment, fresh: @shop.fresh, friesGood: @shop.friesGood, glove: @shop.glove, headset: @shop.headset, hospitalityComment: @shop.hospitalityComment, insideTrash: @shop.insideTrash, itemsOrdered: @shop.itemsOrdered, kiosks: @shop.kiosks, lidsClosed: @shop.lidsClosed, lotClean: @shop.lotClean, lotGum: @shop.lotGum, loyalty: @shop.loyalty, marketing: @shop.marketing, mgrAppearance: @shop.mgrAppearance, numberCars: @shop.numberCars, numberGuests: @shop.numberGuests, oepTime: @shop.oepTime, organization_id: @shop.organization_id, otName: @shop.otName, otPPE: @shop.otPPE, p2PPE: @shop.p2PPE, pPPE: @shop.pPPE, pfTell: @shop.pfTell, pieTimer: @shop.pieTimer, possiblePoints: @shop.possiblePoints, ppe: @shop.ppe, prepTimer: @shop.prepTimer, presell: @shop.presell, presentTime: @shop.presentTime, presenterGreet: @shop.presenterGreet, presenterName: @shop.presenterName, presenterTell: @shop.presenterTell, promptCondiments: @shop.promptCondiments, pullForward: @shop.pullForward, pullForwardPresenterName: @shop.pullForwardPresenterName, pullForwardTime: @shop.pullForwardTime, qtrCorrect: @shop.qtrCorrect, qtrDate: @shop.qtrDate, qtrTime: @shop.qtrTime, qualityComment: @shop.qualityComment, r2d2Charts: @shop.r2d2Charts, rdm: @shop.rdm, readerboard: @shop.readerboard, repeatOrderAsk: @shop.repeatOrderAsk, responseTime: @shop.responseTime, restroomClean: @shop.restroomClean, sanitizer: @shop.sanitizer, score: @shop.score, shiftMgrComment: @shop.shiftMgrComment, shopDate: @shop.shopDate, shopTime: @shop.shopTime, shopType: @shop.shopType, store_id: @shop.store_id, tableClean: @shop.tableClean, tableService: @shop.tableService, tableTent: @shop.tableTent, tandem: @shop.tandem, totalTime: @shop.totalTime, trashFull: @shop.trashFull, tvOn: @shop.tvOn, uhcTimer: @shop.uhcTimer, upFront: @shop.upFront, upsell: @shop.upsell, ventsClean: @shop.ventsClean, waitTime: @shop.waitTime, windowsClean: @shop.windowsClean } }
    end

    assert_redirected_to shop_url(Shop.last)
  end

  test "should show shop" do
    get shop_url(@shop)
    assert_response :success
  end

  test "should get edit" do
    get edit_shop_url(@shop)
    assert_response :success
  end

  test "should update shop" do
    patch shop_url(@shop), params: { shop: { accuracyComment: @shop.accuracyComment, achievedPoints: @shop.achievedPoints, bunTimer: @shop.bunTimer, cashierAsk: @shop.cashierAsk, cashierGreeting: @shop.cashierGreeting, cashierName: @shop.cashierName, cashierRound: @shop.cashierRound, cleanComment: @shop.cleanComment, codClean: @shop.codClean, codGum: @shop.codGum, commentSignVisible: @shop.commentSignVisible, completeOrder: @shop.completeOrder, condiment: @shop.condiment, condimentBag: @shop.condimentBag, contactless: @shop.contactless, corralClean: @shop.corralClean, crewAppearance: @shop.crewAppearance, crewRoom: @shop.crewRoom, csPPE: @shop.csPPE, docRequired: @shop.docRequired, drinkClean: @shop.drinkClean, drinkGood: @shop.drinkGood, dtClean: @shop.dtClean, dtCommentNumber: @shop.dtCommentNumber, dtGlassClean: @shop.dtGlassClean, dtGum: @shop.dtGum, fastComment: @shop.fastComment, fcDeliveryTime: @shop.fcDeliveryTime, fcTotalTime: @shop.fcTotalTime, fcWaitTime: @shop.fcWaitTime, floorClean: @shop.floorClean, folded: @shop.folded, foodSafetyComment: @shop.foodSafetyComment, fresh: @shop.fresh, friesGood: @shop.friesGood, glove: @shop.glove, headset: @shop.headset, hospitalityComment: @shop.hospitalityComment, insideTrash: @shop.insideTrash, itemsOrdered: @shop.itemsOrdered, kiosks: @shop.kiosks, lidsClosed: @shop.lidsClosed, lotClean: @shop.lotClean, lotGum: @shop.lotGum, loyalty: @shop.loyalty, marketing: @shop.marketing, mgrAppearance: @shop.mgrAppearance, numberCars: @shop.numberCars, numberGuests: @shop.numberGuests, oepTime: @shop.oepTime, organization_id: @shop.organization_id, otName: @shop.otName, otPPE: @shop.otPPE, p2PPE: @shop.p2PPE, pPPE: @shop.pPPE, pfTell: @shop.pfTell, pieTimer: @shop.pieTimer, possiblePoints: @shop.possiblePoints, ppe: @shop.ppe, prepTimer: @shop.prepTimer, presell: @shop.presell, presentTime: @shop.presentTime, presenterGreet: @shop.presenterGreet, presenterName: @shop.presenterName, presenterTell: @shop.presenterTell, promptCondiments: @shop.promptCondiments, pullForward: @shop.pullForward, pullForwardPresenterName: @shop.pullForwardPresenterName, pullForwardTime: @shop.pullForwardTime, qtrCorrect: @shop.qtrCorrect, qtrDate: @shop.qtrDate, qtrTime: @shop.qtrTime, qualityComment: @shop.qualityComment, r2d2Charts: @shop.r2d2Charts, rdm: @shop.rdm, readerboard: @shop.readerboard, repeatOrderAsk: @shop.repeatOrderAsk, responseTime: @shop.responseTime, restroomClean: @shop.restroomClean, sanitizer: @shop.sanitizer, score: @shop.score, shiftMgrComment: @shop.shiftMgrComment, shopDate: @shop.shopDate, shopTime: @shop.shopTime, shopType: @shop.shopType, store_id: @shop.store_id, tableClean: @shop.tableClean, tableService: @shop.tableService, tableTent: @shop.tableTent, tandem: @shop.tandem, totalTime: @shop.totalTime, trashFull: @shop.trashFull, tvOn: @shop.tvOn, uhcTimer: @shop.uhcTimer, upFront: @shop.upFront, upsell: @shop.upsell, ventsClean: @shop.ventsClean, waitTime: @shop.waitTime, windowsClean: @shop.windowsClean } }
    assert_redirected_to shop_url(@shop)
  end

  test "should destroy shop" do
    assert_difference("Shop.count", -1) do
      delete shop_url(@shop)
    end

    assert_redirected_to shops_url
  end
end
