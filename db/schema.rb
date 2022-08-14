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

ActiveRecord::Schema[7.0].define(version: 2022_08_14_112350) do
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

  create_table "covid_statuses", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.bigint "store_id", null: false
    t.string "status", null: false
    t.bigint "user_id", null: false
    t.string "timecard", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_covid_statuses_on_organization_id"
    t.index ["store_id"], name: "index_covid_statuses_on_store_id"
    t.index ["user_id"], name: "index_covid_statuses_on_user_id"
  end

  create_table "curriculums", force: :cascade do |t|
    t.string "name", null: false
    t.date "start_date", null: false
    t.string "class_type", null: false
    t.bigint "organization_id", null: false
    t.boolean "current", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_curriculums_on_organization_id"
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

  create_table "food_handler_cards", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.bigint "user_id", null: false
    t.date "issue_date"
    t.date "expiration_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_food_handler_cards_on_organization_id"
    t.index ["store_id"], name: "index_food_handler_cards_on_store_id"
    t.index ["user_id"], name: "index_food_handler_cards_on_user_id"
  end

  create_table "food_safety_audits", force: :cascade do |t|
    t.string "fs1_us"
    t.string "fs2_us"
    t.string "fs3_us"
    t.string "fs4_us"
    t.string "fs5_us"
    t.string "fs6_us"
    t.string "fs7_us"
    t.string "fs8_us"
    t.string "fs9_us"
    t.string "fs10_us"
    t.string "fs11_us"
    t.string "fs12_us"
    t.string "fs13_us"
    t.string "fs14_us"
    t.string "fs15_us"
    t.string "fs16_us"
    t.string "fs17_us"
    t.string "fs18_us"
    t.string "fs19_us"
    t.string "fs19_us_01"
    t.string "fs20_us"
    t.string "fs21_us"
    t.string "fs22_us"
    t.string "fs23_us"
    t.string "fs24_us"
    t.string "fs25_us"
    t.string "fs26_us"
    t.string "fs26_us_01"
    t.string "fs27_us"
    t.string "fs28_us"
    t.string "fs29_us"
    t.string "fs30_us"
    t.string "fs31_us"
    t.string "fs32_us"
    t.string "fs33_us"
    t.bigint "store_id", null: false
    t.bigint "organization_id", null: false
    t.string "score"
    t.date "shop_date"
    t.time "shop_time"
    t.bigint "auditor_id"
    t.bigint "manager_id"
    t.boolean "critical"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditor_id"], name: "index_food_safety_audits_on_auditor_id"
    t.index ["manager_id"], name: "index_food_safety_audits_on_manager_id"
    t.index ["organization_id"], name: "index_food_safety_audits_on_organization_id"
    t.index ["store_id"], name: "index_food_safety_audits_on_store_id"
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

  create_table "mocs", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.date "moc_date"
    t.time "moc_time"
    t.string "ops_score"
    t.string "service_score"
    t.string "quality_score"
    t.string "cleanliness_score"
    t.boolean "verified"
    t.string "dt_cars_target_1"
    t.string "dt_cars_target_2"
    t.string "dt_cars_target_3"
    t.string "dt_cars_actual_1"
    t.string "dt_cars_actual_2"
    t.string "dt_cars_actual_3"
    t.string "dt_oepe_target_1"
    t.string "dt_oepe_target_2"
    t.string "dt_oepe_target_3"
    t.string "dt_oepe_actual_1"
    t.string "dt_oepe_actual_2"
    t.string "dt_oepe_actual_3"
    t.string "di_guest_target_1"
    t.string "di_guest_target_2"
    t.string "di_guest_target_3"
    t.string "di_guest_actual_1"
    t.string "di_guest_actual_2"
    t.string "di_guest_actual_3"
    t.string "di_time_target_1"
    t.string "di_time_target_2"
    t.string "di_time_target_3"
    t.string "di_time_actual_1"
    t.string "di_time_actual_2"
    t.string "di_time_actual_3"
    t.string "add_target_1"
    t.string "add_target_2"
    t.string "add_target_3"
    t.string "add_actual_1"
    t.string "add_actual_2"
    t.string "add_actual_3"
    t.string "q1"
    t.string "q2"
    t.string "q3"
    t.string "q4"
    t.string "q5"
    t.string "q6"
    t.string "q7"
    t.string "q8"
    t.string "q9"
    t.string "q10"
    t.string "q11"
    t.string "q12"
    t.string "q13"
    t.string "q14"
    t.string "q15"
    t.string "q16"
    t.string "q17"
    t.string "q18"
    t.string "q19"
    t.string "q20"
    t.string "q21"
    t.string "q22"
    t.string "q23"
    t.string "q24"
    t.string "q25"
    t.string "q26"
    t.string "q27"
    t.string "q28"
    t.string "q29"
    t.string "q30"
    t.string "q31"
    t.string "q32"
    t.string "q33"
    t.string "q34"
    t.string "q35"
    t.string "q36"
    t.string "q37"
    t.string "q38"
    t.string "q39"
    t.string "q40"
    t.string "q41"
    t.string "q42"
    t.string "q43"
    t.string "q44"
    t.string "q45"
    t.string "q46"
    t.string "q47"
    t.string "q48"
    t.string "q49"
    t.string "q50"
    t.string "q51"
    t.string "q52"
    t.string "q53"
    t.string "q54"
    t.string "q55"
    t.string "q56"
    t.string "q57"
    t.string "q58"
    t.string "q59"
    t.string "q60"
    t.string "q61"
    t.string "q62"
    t.string "q63"
    t.string "q64"
    t.string "opstotal"
    t.string "qualitytotal"
    t.string "servicetotal"
    t.string "cleantotal"
    t.string "signature"
    t.string "preshiftsuccess"
    t.string "servicesuccess"
    t.string "grillsuccess"
    t.string "cleansuccess"
    t.string "postshiftsuccess"
    t.string "very_good_comments"
    t.string "more_practice_comments"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_mocs_on_organization_id"
    t.index ["store_id"], name: "index_mocs_on_store_id"
  end

  create_table "new_hires", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.bigint "user_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.string "social", null: false
    t.string "rate", null: false
    t.date "birthdate", null: false
    t.bigint "position_id", null: false
    t.string "referred_by"
    t.boolean "rehire", default: false, null: false
    t.string "notes"
    t.string "hear", null: false
    t.boolean "attended", default: false, null: false
    t.string "requirements"
    t.boolean "background_received", default: false, null: false
    t.boolean "background_ok", default: false, null: false
    t.string "comments"
    t.boolean "background_na", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_new_hires_on_organization_id"
    t.index ["position_id"], name: "index_new_hires_on_position_id"
    t.index ["store_id"], name: "index_new_hires_on_store_id"
    t.index ["user_id"], name: "index_new_hires_on_user_id"
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
    t.boolean "active", default: true
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
    t.string "shift_manager", null: false
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

  create_table "shops", force: :cascade do |t|
    t.bigint "store_id", null: false
    t.bigint "organization_id", null: false
    t.date "shopDate", null: false
    t.time "shopTime", null: false
    t.string "shopType", null: false
    t.string "upFront"
    t.string "mgrAppearance"
    t.string "headset"
    t.string "crewAppearance"
    t.string "r2d2Charts"
    t.string "rdm"
    t.string "kiosks"
    t.string "tableService"
    t.string "tableTent"
    t.string "shiftMgrComment"
    t.string "fastComment"
    t.string "qualityComment"
    t.string "accuracyComment"
    t.string "hospitalityComment"
    t.string "cleanComment"
    t.string "foodSafetyComment"
    t.string "itemsOrdered"
    t.string "waitTime"
    t.string "responseTime"
    t.string "presentTime"
    t.string "oepTime"
    t.string "totalTime"
    t.string "pullForward"
    t.string "pullForwardTime"
    t.string "numberCars"
    t.string "tandem"
    t.string "fcWaitTime"
    t.string "fcDeliveryTime"
    t.string "curbsideTotalTime"
    t.string "loyalty_name"
    t.string "fcTotalTime"
    t.string "numberGuests"
    t.string "completeOrder"
    t.string "condiment"
    t.string "condimentBag"
    t.string "readerboard"
    t.string "marketing"
    t.string "dtCommentNumber"
    t.string "presell"
    t.string "upsell"
    t.string "otName"
    t.string "cashierName"
    t.string "presenterName"
    t.string "pullForwardPresenterName"
    t.string "repeatOrderAsk"
    t.string "cashierGreeting"
    t.string "cashierAsk"
    t.string "presenterGreet"
    t.string "presenterTell"
    t.string "pfTell"
    t.string "fresh"
    t.string "friesGood"
    t.string "drinkGood"
    t.string "codClean"
    t.string "dtClean"
    t.string "lotClean"
    t.string "corralClean"
    t.string "lidsClosed"
    t.string "dtGlassClean"
    t.string "windowsClean"
    t.string "trashFull"
    t.string "commentSignVisible"
    t.string "floorClean"
    t.string "tableClean"
    t.string "drinkClean"
    t.string "ventsClean"
    t.string "sanitizer"
    t.string "tvOn"
    t.string "restroomClean"
    t.string "insideTrash"
    t.string "crewRoom"
    t.string "uhcTimer"
    t.string "prepTimer"
    t.string "bunTimer"
    t.string "qtrCorrect"
    t.date "qtrDate"
    t.time "qtrTime"
    t.string "glove"
    t.string "pieTimer"
    t.string "bakeryTimer"
    t.string "lotGum"
    t.string "codGum"
    t.string "dtGum"
    t.string "otPPE"
    t.string "csPPE"
    t.string "pPPE"
    t.string "p2PPE"
    t.string "folded"
    t.string "cashierRound"
    t.integer "possiblePoints"
    t.integer "achievedPoints"
    t.float "score"
    t.string "promptCondiments"
    t.boolean "docRequired"
    t.string "loyalty"
    t.bigint "shopper_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "shiftManager"
    t.index ["organization_id"], name: "index_shops_on_organization_id"
    t.index ["shopper_id"], name: "index_shops_on_shopper_id"
    t.index ["store_id"], name: "index_shops_on_store_id"
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

  create_table "tclasses", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "instructor_id", null: false
    t.string "duration", null: false
    t.integer "capacity", null: false
    t.date "class_date", null: false
    t.time "class_time", null: false
    t.string "location", null: false
    t.bigint "curriculum_id", null: false
    t.string "expense", default: "0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["curriculum_id"], name: "index_tclasses_on_curriculum_id"
    t.index ["instructor_id"], name: "index_tclasses_on_instructor_id"
  end

  create_table "tclasses_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "tclass_id", null: false
    t.index ["tclass_id", "user_id"], name: "index_tclasses_users_on_tclass_id_and_user_id"
    t.index ["user_id", "tclass_id"], name: "index_tclasses_users_on_user_id_and_tclass_id"
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
    t.date "birthdate"
    t.date "hire_date"
    t.integer "past_stores", default: [], array: true
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

  create_table "wellnesses", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "store_id", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "tc", default: "0", null: false
    t.string "temp", null: false
    t.string "q1", null: false
    t.string "q2", null: false
    t.string "q3", null: false
    t.string "q4", null: false
    t.boolean "reported"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_wellnesses_on_organization_id"
    t.index ["store_id"], name: "index_wellnesses_on_store_id"
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
  add_foreign_key "covid_statuses", "organizations"
  add_foreign_key "covid_statuses", "stores"
  add_foreign_key "covid_statuses", "users"
  add_foreign_key "curriculums", "organizations"
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
  add_foreign_key "food_handler_cards", "organizations"
  add_foreign_key "food_handler_cards", "stores"
  add_foreign_key "food_handler_cards", "users"
  add_foreign_key "food_safety_audits", "organizations"
  add_foreign_key "food_safety_audits", "stores"
  add_foreign_key "guests", "organizations"
  add_foreign_key "mocs", "organizations"
  add_foreign_key "mocs", "stores"
  add_foreign_key "new_hires", "organizations"
  add_foreign_key "new_hires", "positions"
  add_foreign_key "new_hires", "stores"
  add_foreign_key "new_hires", "users"
  add_foreign_key "positions", "organizations"
  add_foreign_key "rewards", "organizations"
  add_foreign_key "safe_audits", "organizations"
  add_foreign_key "safe_audits", "stores"
  add_foreign_key "shops", "organizations"
  add_foreign_key "shops", "stores"
  add_foreign_key "stores", "organizations"
  add_foreign_key "tclasses", "curriculums"
  add_foreign_key "users", "organizations"
  add_foreign_key "users", "positions"
  add_foreign_key "vendors", "organizations"
  add_foreign_key "wellnesses", "organizations"
  add_foreign_key "wellnesses", "stores"
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
