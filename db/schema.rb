ActiveRecord::Schema[7.0].define(version: 2023_03_15_075446) do
  enable_extension "plpgsql"

  create_table "buses", force: :cascade do |t|
    t.string "bus_name", default: "", null: false
    t.string "bus_type", default: "", null: false
    t.string "bus_brand", default: "", null: false
    t.integer "bus_capacity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password", default: "", null: false
    t.string "phone", default: "", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name", default: "", null: false
    t.integer "role", default: 0, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["user_name"], name: "index_users_on_user_name", unique: true
  end

end
