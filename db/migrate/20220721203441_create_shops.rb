class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.references :store, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.date :shopDate, null: false
      t.time :shopTime, null: false
      t.string :shopType, null: false
      t.string :upFront
      t.string :mgrAppearance
      t.string :headset
      t.string :crewAppearance
      t.string :r2d2Charts
      t.string :rdm
      t.string :kiosks
      t.string :tableService
      t.string :tableTent
      t.string :shiftMgrComment
      t.string :fastComment
      t.string :qualityComment
      t.string :accuracyComment
      t.string :hospitalityComment
      t.string :cleanComment
      t.string :foodSafetyComment
      t.string :itemsOrdered
      t.string :waitTime
      t.string :responseTime
      t.string :presentTime
      t.string :oepTime
      t.string :totalTime
      t.string :pullForward
      t.string :pullForwardTime
      t.string :numberCars
      t.string :tandem
      t.string :fcWaitTime
      t.string :fcDeliveryTime
      t.string :curbsideTotalTime
      t.string :loyalty_name
      t.string :fcTotalTime
      t.string :numberGuests
      t.string :completeOrder
      t.string :condiment
      t.string :condimentBag
      t.string :readerboard
      t.string :marketing
      t.string :dtCommentNumber
      t.string :presell
      t.string :upsell
      t.string :otName
      t.string :cashierName
      t.string :presenterName
      t.string :pullForwardPresenterName
      t.string :repeatOrderAsk
      t.string :cashierGreeting
      t.string :cashierAsk
      t.string :presenterGreet
      t.string :presenterTell
      t.string :pfTell
      t.string :fresh
      t.string :friesGood
      t.string :drinkGood
      t.string :codClean
      t.string :dtClean
      t.string :lotClean
      t.string :corralClean
      t.string :lidsClosed
      t.string :dtGlassClean
      t.string :windowsClean
      t.string :trashFull
      t.string :commentSignVisible
      t.string :floorClean
      t.string :tableClean
      t.string :drinkClean
      t.string :ventsClean
      t.string :sanitizer
      t.string :tvOn
      t.string :restroomClean
      t.string :insideTrash
      t.string :crewRoom
      t.string :uhcTimer
      t.string :prepTimer
      t.string :bunTimer
      t.string :qtrCorrect
      t.date :qtrDate
      t.time :qtrTime
      t.string :glove
      t.string :pieTimer
      t.string :bakeryTimer
      t.string :lotGum
      t.string :codGum
      t.string :dtGum
      t.string :otPPE
      t.string :csPPE
      t.string :pPPE
      t.string :p2PPE
      t.string :folded
      t.string :cashierRound
      t.integer :possiblePoints
      t.integer :achievedPoints
      t.float :score
      t.string :promptCondiments
      t.boolean :docRequired
      t.string :loyalty
      t.references :shopper, null: false

      t.timestamps
    end
  end
end
