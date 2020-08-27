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

ActiveRecord::Schema.define(version: 2020_08_27_003054) do

  create_table "characters", force: :cascade do |t|
    t.string "name"
    t.integer "barbarian_level"
    t.integer "bard_level"
    t.integer "cleric_level"
    t.integer "druid_level"
    t.integer "fighter_level"
    t.integer "monk_level"
    t.integer "paladin_level"
    t.integer "ranger_level"
    t.integer "rogue_level"
    t.integer "sorcerer_level"
    t.integer "warlock_level"
    t.integer "wizard_level"
    t.integer "str"
    t.integer "dex"
    t.integer "con"
    t.integer "int"
    t.integer "wis"
    t.integer "cha"
    t.integer "max_hp"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

end
