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

ActiveRecord::Schema[7.2].define(version: 20_250_127_081_938) do
  create_table 'consumptions', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'food_entry_id', null: false
    t.date 'consumption_date', null: false
    t.integer 'quantity', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['food_entry_id'], name: 'index_consumptions_on_food_entry_id'
    t.index ['user_id'], name: 'index_consumptions_on_user_id'
  end

  create_table 'food_entries', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.string 'name', null: false
    t.float 'calories', null: false
    t.float 'carbs', null: false
    t.float 'proteins', null: false
    t.float 'fats', null: false
    t.boolean 'public', default: false, null: false
    t.text 'image', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_food_entries_on_user_id'
  end

  create_table 'users', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.string 'name', null: false
    t.string 'email', null: false
    t.string 'password_digest', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
  end

  create_table 'weights', charset: 'utf8mb4', collation: 'utf8mb4_general_ci', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.float 'weight', null: false
    t.date 'date', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_weights_on_user_id'
  end

  add_foreign_key 'consumptions', 'food_entries'
  add_foreign_key 'consumptions', 'users'
  add_foreign_key 'food_entries', 'users'
  add_foreign_key 'weights', 'users'
end
