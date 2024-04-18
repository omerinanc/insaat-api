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

ActiveRecord::Schema[7.0].define(version: 2023_09_26_162456) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "daires", force: :cascade do |t|
    t.string "isim_soyisim"
    t.string "telefon_numarasi"
    t.date "anlasma_tarihi"
    t.decimal "anlasma_miktari"
    t.decimal "on_odeme"
    t.date "taksit_tarihi"
    t.decimal "taksit_miktari"
    t.date "tapu_tarihi"
    t.date "teslim_tarihi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taserons", force: :cascade do |t|
    t.string "iş_türü"
    t.decimal "anlaşma_miktari"
    t.string "iş_süresi"
    t.decimal "odenen_miktar"
    t.string "parametre_5"
    t.string "parametre_6"
    t.string "parametre_7"
    t.date "anlaşma_tarihi"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
