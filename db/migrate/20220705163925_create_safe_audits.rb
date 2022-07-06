class CreateSafeAudits < ActiveRecord::Migration[7.0]
  def change
    create_table :safe_audits do |t|
      t.references :auditor
      t.references :manager
      t.references :store, null: false, foreign_key: true
      t.references :organization, null: false, foreign_key: true
      t.date :safe_audit_date, null: false
      t.time :safe_audit_time, null: false
      t.string :comment
      t.integer :hundred
      t.integer :fifty
      t.integer :twenty
      t.integer :ten
      t.integer :five
      t.integer :two
      t.integer :one
      t.integer :quarter
      t.integer :dime
      t.integer :nickel
      t.integer :penny
      t.integer :dollar_coin
      t.integer :half_dollar
      t.float :misc_coin
      t.integer :gift_certificate
      t.integer :gift_certificate_redeemed
      t.float :receipt
      t.float :other
      t.float :coin_changer
      t.integer :drawer
      t.integer :drawer_amount
      t.integer :working_headset, null: false
      t.integer :non_working_headset, null: false
      t.integer :total_headset, null: false
      t.float :misc_other
      t.float :total_safe
      t.float :safe_variance
      t.string :manager, null: false
      t.string :signature, null: false
      t.integer :missing_headset
      t.integer :ipad, null: false

      t.timestamps
    end
  end
end
