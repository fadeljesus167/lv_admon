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

ActiveRecord::Schema[7.1].define(version: 2024_04_05_134025) do
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

  create_table "bills", force: :cascade do |t|
    t.integer "payment_id", default: 1, null: false
    t.integer "status", default: 0, null: false
    t.boolean "delivered", default: false, null: false
    t.date "bill_date", null: false
    t.date "delivered_date"
    t.string "bill_reference", null: false
    t.string "bill_description", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "fee_id", null: false
    t.index ["bill_reference"], name: "index_bills_on_bill_reference", unique: true
    t.index ["fee_id"], name: "index_bills_on_fee_id"
    t.index ["payment_id"], name: "index_bills_on_payment_id"
  end

  create_table "fees", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "month", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_fees_on_student_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "payment_date", null: false
    t.string "issuing_bank", null: false
    t.string "reference", null: false
    t.string "receiving_bank", null: false
    t.decimal "amount", precision: 15, scale: 2, null: false
    t.boolean "verified", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "student_id", default: 1, null: false
    t.index ["reference"], name: "index_payments_on_reference", unique: true
    t.index ["student_id"], name: "index_payments_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", null: false
    t.string "grade", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "bills", "fees"
  add_foreign_key "bills", "payments"
  add_foreign_key "fees", "students"
  add_foreign_key "payments", "students"
end
