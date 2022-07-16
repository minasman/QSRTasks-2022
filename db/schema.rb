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

ActiveRecord::Schema[7.0].define(version: 2022_07_12_113202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "action_mailbox_inbound_emails", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "message_id", null: false
    t.string "message_checksum", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id", "message_checksum"], name: "index_action_mailbox_inbound_emails_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

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

  create_table "documentations", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.bigint "employee_named_id", null: false
    t.bigint "awarded_by_id", null: false
    t.bigint "position_id", null: false
    t.bigint "document_id", null: false
    t.string "documentation_type", null: false
    t.string "level", null: false
    t.string "documentation_class", null: false
    t.string "description", null: false
    t.integer "points"
    t.date "document_date", null: false
    t.boolean "individual", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["awarded_by_id"], name: "index_documentations_on_awarded_by_id"
    t.index ["document_id"], name: "index_documentations_on_document_id"
    t.index ["employee_named_id"], name: "index_documentations_on_employee_named_id"
    t.index ["organization_id"], name: "index_documentations_on_organization_id"
    t.index ["position_id"], name: "index_documentations_on_position_id"
    t.index ["store_id"], name: "index_documentations_on_store_id"
  end

  create_table "documents", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "documentation_type", null: false
    t.string "documentation_class", null: false
    t.string "level", null: false
    t.string "definition", null: false
    t.integer "points", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_documents_on_organization_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.string "name", null: false
    t.date "service_date", null: false
    t.string "equipment_tag", null: false
    t.bigint "store_id", null: false
    t.bigint "equipment_type_id", null: false
    t.bigint "equipment_area_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_area_id"], name: "index_equipment_on_equipment_area_id"
    t.index ["equipment_type_id"], name: "index_equipment_on_equipment_type_id"
    t.index ["organization_id"], name: "index_equipment_on_organization_id"
    t.index ["store_id"], name: "index_equipment_on_store_id"
  end

  create_table "equipment_areas", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_equipment_areas_on_organization_id"
  end

  create_table "equipment_types", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "equipment_area_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_area_id"], name: "index_equipment_types_on_equipment_area_id"
    t.index ["organization_id"], name: "index_equipment_types_on_organization_id"
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

  create_table "rewards", force: :cascade do |t|
    t.string "name", null: false
    t.integer "value", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_rewards_on_organization_id"
  end

  create_table "safe_audits", force: :cascade do |t|
    t.bigint "auditor_id"
    t.bigint "manager_id"
    t.bigint "store_id", null: false
    t.bigint "organization_id", null: false
    t.date "safe_audit_date", null: false
    t.time "safe_audit_time", null: false
    t.string "comment"
    t.integer "hundred"
    t.integer "fifty"
    t.integer "twenty"
    t.integer "ten"
    t.integer "five"
    t.integer "two"
    t.integer "one"
    t.integer "quarter"
    t.integer "dime"
    t.integer "nickel"
    t.integer "penny"
    t.integer "dollar_coin"
    t.integer "half_dollar"
    t.float "misc_coin"
    t.integer "gift_certificate"
    t.integer "gift_certificate_redeemed"
    t.float "receipt"
    t.float "other"
    t.float "coin_changer"
    t.integer "drawer"
    t.integer "drawer_amount"
    t.integer "working_headset", null: false
    t.integer "non_working_headset", null: false
    t.integer "total_headset", null: false
    t.float "total_safe"
    t.float "safe_variance"
    t.string "manager", null: false
    t.string "signature", null: false
    t.integer "missing_headset"
    t.integer "ipad", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditor_id"], name: "index_safe_audits_on_auditor_id"
    t.index ["manager_id"], name: "index_safe_audits_on_manager_id"
    t.index ["organization_id"], name: "index_safe_audits_on_organization_id"
    t.index ["store_id"], name: "index_safe_audits_on_store_id"
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
    t.integer "safe", null: false
    t.integer "headset", null: false
    t.string "store_type", null: false
    t.integer "ipad", null: false
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
    t.integer "accumulated_points", default: 0
    t.integer "rewards", default: [], array: true
    t.integer "redeemed_rewards", default: [], array: true
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["organization_id"], name: "index_users_on_organization_id"
    t.index ["position_id"], name: "index_users_on_position_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name", null: false
    t.string "email"
    t.string "phone"
    t.string "contact"
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_vendors_on_organization_id"
  end

  create_table "workorder_updates", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "workorder_id", null: false
    t.string "current_update", null: false
    t.string "manager"
    t.string "signature"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_workorder_updates_on_user_id"
    t.index ["workorder_id"], name: "index_workorder_updates_on_workorder_id"
  end

  create_table "workorders", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "user_id", null: false
    t.bigint "organization_id", null: false
    t.bigint "equipment_id", null: false
    t.bigint "equipment_area_id", null: false
    t.bigint "equipment_type_id", null: false
    t.string "workorder_issue", null: false
    t.string "status", default: "Open"
    t.integer "assigned"
    t.string "level", default: "NULL"
    t.string "team", default: "NULL"
    t.bigint "vendor_id", default: 166, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["equipment_area_id"], name: "index_workorders_on_equipment_area_id"
    t.index ["equipment_id"], name: "index_workorders_on_equipment_id"
    t.index ["equipment_type_id"], name: "index_workorders_on_equipment_type_id"
    t.index ["organization_id"], name: "index_workorders_on_organization_id"
    t.index ["store_id"], name: "index_workorders_on_store_id"
    t.index ["user_id"], name: "index_workorders_on_user_id"
    t.index ["vendor_id"], name: "index_workorders_on_vendor_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comment_updates", "comments"
  add_foreign_key "comment_updates", "users"
  add_foreign_key "comments", "guests"
  add_foreign_key "comments", "organizations"
  add_foreign_key "comments", "stores"
  add_foreign_key "comments", "users"
  add_foreign_key "documentations", "documents"
  add_foreign_key "documentations", "organizations"
  add_foreign_key "documentations", "positions"
  add_foreign_key "documentations", "stores"
  add_foreign_key "documents", "organizations"
  add_foreign_key "equipment", "equipment_areas"
  add_foreign_key "equipment", "equipment_types"
  add_foreign_key "equipment", "organizations"
  add_foreign_key "equipment", "stores"
  add_foreign_key "equipment_areas", "organizations"
  add_foreign_key "equipment_types", "equipment_areas"
  add_foreign_key "equipment_types", "organizations"
  add_foreign_key "guests", "organizations"
  add_foreign_key "positions", "organizations"
  add_foreign_key "rewards", "organizations"
  add_foreign_key "safe_audits", "organizations"
  add_foreign_key "safe_audits", "stores"
  add_foreign_key "stores", "organizations"
  add_foreign_key "users", "organizations"
  add_foreign_key "users", "positions"
  add_foreign_key "vendors", "organizations"
  add_foreign_key "workorder_updates", "users"
  add_foreign_key "workorder_updates", "workorders"
  add_foreign_key "workorders", "equipment"
  add_foreign_key "workorders", "equipment_areas"
  add_foreign_key "workorders", "equipment_types"
  add_foreign_key "workorders", "organizations"
  add_foreign_key "workorders", "stores"
  add_foreign_key "workorders", "users"
  add_foreign_key "workorders", "vendors"
end
