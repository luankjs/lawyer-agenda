# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_08_24_173003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lawyers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "lawyers_parts", id: false, force: :cascade do |t|
    t.bigint "part_id", null: false
    t.bigint "lawyer_id", null: false
  end

  create_table "parts", force: :cascade do |t|
    t.integer "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "adjudicating_part_code"
    t.string "number"
    t.integer "year"
    t.string "kind"
    t.datetime "date"
    t.datetime "published_at"
    t.string "mode"
    t.json "meta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schedules_trials", id: false, force: :cascade do |t|
    t.bigint "schedule_id", null: false
    t.bigint "trial_id", null: false
  end

  create_table "trial_parts", force: :cascade do |t|
    t.bigint "trial_id"
    t.bigint "part_id"
    t.integer "proxy_year"
    t.integer "proxy_number"
    t.index ["part_id"], name: "index_trial_parts_on_part_id"
    t.index ["trial_id"], name: "index_trial_parts_on_trial_id"
  end

  create_table "trials", force: :cascade do |t|
    t.string "number"
    t.json "meta"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
