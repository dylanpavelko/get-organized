# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150911040054) do

  create_table "activities", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_has_exercise_centers", force: true do |t|
    t.integer  "activity_id"
    t.integer  "exercise_center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_has_exercise_centers", ["activity_id"], name: "index_activity_has_exercise_centers_on_activity_id"
  add_index "activity_has_exercise_centers", ["exercise_center_id"], name: "index_activity_has_exercise_centers_on_exercise_center_id"

  create_table "activity_has_inventory_items", force: true do |t|
    t.integer  "activity_id"
    t.integer  "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activity_has_inventory_items", ["activity_id"], name: "index_activity_has_inventory_items_on_activity_id"
  add_index "activity_has_inventory_items", ["inventory_item_id"], name: "index_activity_has_inventory_items_on_inventory_item_id"

  create_table "airlines", force: true do |t|
    t.string   "name"
    t.integer  "loyalty_program_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "airlines", ["loyalty_program_id"], name: "index_airlines_on_loyalty_program_id"

  create_table "attraction_categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attractions", force: true do |t|
    t.integer  "attraction_category_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "trip_advisor_link"
    t.integer  "location_id"
    t.integer  "hotel_id"
  end

  add_index "attractions", ["attraction_category_id"], name: "index_attractions_on_attraction_category_id"
  add_index "attractions", ["hotel_id"], name: "index_attractions_on_hotel_id"
  add_index "attractions", ["location_id"], name: "index_attractions_on_location_id"

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_centers", force: true do |t|
    t.string   "gymType"
    t.string   "name"
    t.string   "site"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hotel_chains", force: true do |t|
    t.string   "name"
    t.integer  "loyalty_program_id"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hotel_chains", ["loyalty_program_id"], name: "index_hotel_chains_on_loyalty_program_id"

  create_table "inventory_items", force: true do |t|
    t.string   "name"
    t.decimal  "amount"
    t.integer  "quantity_type_id"
    t.boolean  "consumable"
    t.decimal  "price"
    t.text     "note"
    t.text     "detail"
    t.string   "brand"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.integer  "subcategory_id"
  end

  add_index "inventory_items", ["category_id"], name: "index_inventory_items_on_category_id"
  add_index "inventory_items", ["quantity_type_id"], name: "index_inventory_items_on_quantity_type_id"
  add_index "inventory_items", ["subcategory_id"], name: "index_inventory_items_on_subcategory_id"

  create_table "itinerary_activities", force: true do |t|
    t.string   "name"
    t.integer  "attraction_id"
    t.decimal  "cost"
    t.integer  "basis_id"
    t.datetime "datetime"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trip_id"
    t.integer  "origination_id"
    t.integer  "destination_id"
    t.integer  "airline_id"
  end

  add_index "itinerary_activities", ["airline_id"], name: "index_itinerary_activities_on_airline_id"
  add_index "itinerary_activities", ["attraction_id"], name: "index_itinerary_activities_on_attraction_id"
  add_index "itinerary_activities", ["basis_id"], name: "index_itinerary_activities_on_basis_id"
  add_index "itinerary_activities", ["destination_id"], name: "index_itinerary_activities_on_destination_id"
  add_index "itinerary_activities", ["origination_id"], name: "index_itinerary_activities_on_origination_id"
  add_index "itinerary_activities", ["trip_id"], name: "index_itinerary_activities_on_trip_id"

  create_table "locations", force: true do |t|
    t.string   "name"
    t.integer  "timezonen_id"
    t.string   "street_address"
    t.string   "street_address2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.decimal  "longitude"
    t.decimal  "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "airport"
  end

  add_index "locations", ["timezonen_id"], name: "index_locations_on_timezonen_id"

  create_table "loyalty_programs", force: true do |t|
    t.string   "name"
    t.string   "number"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image"
  end

  create_table "quantity_types", force: true do |t|
    t.string   "quantityType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subcategories", force: true do |t|
    t.string   "subcategory"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["category_id"], name: "index_subcategories_on_category_id"

  create_table "trip_has_inventory_items", force: true do |t|
    t.integer  "trip_id"
    t.integer  "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trip_has_inventory_items", ["inventory_item_id"], name: "index_trip_has_inventory_items_on_inventory_item_id"
  add_index "trip_has_inventory_items", ["trip_id"], name: "index_trip_has_inventory_items_on_trip_id"

  create_table "trips", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "itinerary_item_id"
    t.string   "blog_link"
    t.string   "photo_link"
    t.string   "tripit_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trips", ["itinerary_item_id"], name: "index_trips_on_itinerary_item_id"

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "encrypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "power_admin"
  end

end
