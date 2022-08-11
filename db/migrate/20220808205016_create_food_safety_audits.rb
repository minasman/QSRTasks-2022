class CreateFoodSafetyAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :food_safety_audits do |t|
      t.string :fs1_us
      t.string :fs2_us
      t.string :fs3_us
      t.string :fs4_us
      t.string :fs5_us
      t.string :fs6_us
      t.string :fs7_us
      t.string :fs8_us
      t.string :fs9_us
      t.string :fs10_us
      t.string :fs11_us
      t.string :fs12_us
      t.string :fs13_us
      t.string :fs14_us
      t.string :fs15_us
      t.string :fs16_us
      t.string :fs17_us
      t.string :fs18_us
      t.string :fs19_us
      t.string :fs19_us_01
      t.string :fs20_us
      t.string :fs21_us
      t.string :fs22_us
      t.string :fs23_us
      t.string :fs24_us
      t.string :fs25_us
      t.string :fs26_us
      t.string :fs26_us_01
      t.string :fs27_us
      t.string :fs28_us
      t.string :fs29_us
      t.string :fs30_us
      t.string :fs31_us
      t.string :fs32_us
      t.string :fs33_us
      t.references :store, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.string :score
      t.date :shop_date
      t.time :shop_time
      t.references :auditor
      t.references :manager
      t.boolean :critical

      t.timestamps
    end
  end
end
