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

ActiveRecord::Schema[7.0].define(version: 2025_12_22_092534) do
  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "contact"
    t.string "pant_lambai"
    t.string "pant_mori"
    t.string "pant_kamar"
    t.string "pant_seat"
    t.string "pant_jang"
    t.string "pant_joro"
    t.string "shirt_kolar"
    t.string "shirt_lambai"
    t.string "shirt_shoulder"
    t.string "shirt_baay"
    t.string "shirt_chhati"
    t.string "shirt_kamar"
    t.string "shirt_seat"
    t.date "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "notes"
    t.string "customer_no"
    t.decimal "shirt_kaf"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
