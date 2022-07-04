# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_07_04_182653) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.boolean "active", default: true, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["confirmation_token"], name: "index_admins_on_confirmation_token", unique: true
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_admins_on_unlock_token", unique: true
  end

  create_table "comment_updates", force: :cascade do |t|
    t.date "update_date", null: false
    t.time "update_time", null: false
    t.string "update_type", null: false
    t.string "current_update", null: false
    t.string "employee_name", null: false
    t.bigint "comment_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comment_id"], name: "index_comment_updates_on_comment_id"
    t.index ["user_id"], name: "index_comment_updates_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.date "visit_date"
    t.time "visit_time"
    t.string "comment_type", null: false
    t.string "source", null: false
    t.string "urgent"
    t.string "case_number", null: false
    t.string "first_issue", null: false
    t.string "first_issue_comment", null: false
    t.string "second_issue"
    t.string "second_issue_comment"
    t.string "third_issue"
    t.string "third_issue_comment"
    t.string "contact_type", null: false
    t.string "visit_type"
    t.string "employee_named"
    t.string "status", default: "Open"
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.bigint "user_id", null: false
    t.bigint "guest_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["guest_id"], name: "index_comments_on_guest_id"
    t.index ["organization_id"], name: "index_comments_on_organization_id"
    t.index ["store_id"], name: "index_comments_on_store_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "guests", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.string "email"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_guests_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name", null: false
    t.string "phone", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "street", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "name", null: false
    t.string "department", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_positions_on_organization_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name", null: false
    t.integer "number", null: false
    t.string "street", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "phone", null: false
    t.string "email", null: false
    t.string "safe", null: false
    t.string "headset", null: false
    t.string "store_type", null: false
    t.boolean "active", default: true, null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_stores_on_organization_id"
  end

  create_table "stores_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "store_id", null: false
    t.index ["store_id", "user_id"], name: "index_stores_users_on_store_id_and_user_id"
    t.index ["user_id", "store_id"], name: "index_stores_users_on_user_id_and_store_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "phone", null: false
    t.boolean "admin", default: false, null: false
    t.boolean "active", default: true, null: false
    t.string "rate", default: "10", null: false
    t.string "payroll_id", null: false
    t.bigint "organization_id", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "position_id", null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "contact"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_vendors_on_organization_id"
  end

  add_foreign_key "comment_updates", "comments"
  add_foreign_key "comment_updates", "users"
  add_foreign_key "comments", "guests"
  add_foreign_key "comments", "organizations"
  add_foreign_key "comments", "stores"
  add_foreign_key "comments", "users"
  add_foreign_key "guests", "organizations"
  add_foreign_key "positions", "organizations"
  add_foreign_key "stores", "organizations"
  add_foreign_key "users", "organizations"
  add_foreign_key "users", "positions"
  add_foreign_key "vendors", "organizations"
end
