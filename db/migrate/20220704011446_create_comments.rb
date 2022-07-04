class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.date :visit_date
      t.time :visit_time
      t.string :comment_type, null: false
      t.string :source, null: false
      t.string :urgent
      t.string :case_number, null: false
      t.string :first_issue, null: false
      t.string :first_issue_comment, null: false
      t.string :second_issue
      t.string :second_issue_comment
      t.string :third_issue
      t.string :third_issue_comment
      t.string :contact_type, null: false
      t.string :visit_type
      t.string :employee_named
      t.string :status, default: "Open"
      t.references :organization, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :guest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
