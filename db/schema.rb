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

ActiveRecord::Schema.define(version: 20151206044035) do

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

  create_table "attraction_has_reviews", force: true do |t|
    t.integer  "attraction_id"
    t.integer  "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "attraction_has_reviews", ["attraction_id"], name: "index_attraction_has_reviews_on_attraction_id"
  add_index "attraction_has_reviews", ["review_id"], name: "index_attraction_has_reviews_on_review_id"

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

  create_table "businesses", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.string   "category"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.text     "body"
    t.integer  "reply_to_id"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id"
  add_index "comments", ["reply_to_id"], name: "index_comments_on_reply_to_id"

  create_table "exercise_centers", force: true do |t|
    t.string   "gymType"
    t.string   "name"
    t.string   "site"
    t.text     "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_items", force: true do |t|
    t.string   "name"
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
    t.text     "amazon_link",      limit: 255
    t.boolean  "container"
    t.boolean  "public"
  end

  add_index "inventory_items", ["category_id"], name: "index_inventory_items_on_category_id"
  add_index "inventory_items", ["quantity_type_id"], name: "index_inventory_items_on_quantity_type_id"
  add_index "inventory_items", ["subcategory_id"], name: "index_inventory_items_on_subcategory_id"

  create_table "inventory_owners", force: true do |t|
    t.integer  "inventory_item_id"
    t.decimal  "amount"
    t.integer  "quantity_type_id"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "stored_in_id"
  end

  add_index "inventory_owners", ["inventory_item_id"], name: "index_inventory_owners_on_inventory_item_id"
  add_index "inventory_owners", ["person_id"], name: "index_inventory_owners_on_person_id"
  add_index "inventory_owners", ["quantity_type_id"], name: "index_inventory_owners_on_quantity_type_id"
  add_index "inventory_owners", ["stored_in_id"], name: "index_inventory_owners_on_stored_in_id"

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
    t.datetime "end"
    t.text     "note"
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

  create_table "people", force: true do |t|
    t.string   "first_name"
    t.string   "nick_name"
    t.string   "last_name"
    t.integer  "user_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "people", ["user_account_id"], name: "index_people_on_user_account_id"

  create_table "pictures", force: true do |t|
    t.string   "name"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "public_inventory_item_queues", force: true do |t|
    t.integer  "item_id"
    t.boolean  "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "public_inventory_item_queues", ["item_id"], name: "index_public_inventory_item_queues_on_item_id"

  create_table "quantity_types", force: true do |t|
    t.string   "quantityType"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: true do |t|
    t.integer  "recipe_id"
    t.string   "amount"
    t.integer  "quantity_type_id"
    t.integer  "food_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "note"
  end

  add_index "recipe_ingredients", ["food_item_id"], name: "index_recipe_ingredients_on_food_item_id"
  add_index "recipe_ingredients", ["quantity_type_id"], name: "index_recipe_ingredients_on_quantity_type_id"
  add_index "recipe_ingredients", ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"

  create_table "recipe_steps", force: true do |t|
    t.integer  "recipe_id"
    t.text     "instruction"
    t.integer  "order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "recipe_steps", ["recipe_id"], name: "index_recipe_steps_on_recipe_id"

  create_table "recipes", force: true do |t|
    t.string   "name"
    t.string   "serving_size"
    t.text     "description"
    t.string   "source"
    t.text     "notes"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "picture_id"
  end

  add_index "recipes", ["author_id"], name: "index_recipes_on_author_id"
  add_index "recipes", ["picture_id"], name: "index_recipes_on_picture_id"

  create_table "reviews", force: true do |t|
    t.integer  "rating"
    t.integer  "comment_id"
    t.integer  "reviewer_id"
    t.boolean  "public"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "reviews", ["comment_id"], name: "index_reviews_on_comment_id"
  add_index "reviews", ["reviewer_id"], name: "index_reviews_on_reviewer_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "security_domain_has_roles", force: true do |t|
    t.integer  "domain_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "security_domain_has_roles", ["domain_id"], name: "index_security_domain_has_roles_on_domain_id"
  add_index "security_domain_has_roles", ["role_id"], name: "index_security_domain_has_roles_on_role_id"

  create_table "security_domains", force: true do |t|
    t.string   "name"
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

  create_table "task_has_security_domains", force: true do |t|
    t.integer  "task_id"
    t.integer  "security_domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "task_has_security_domains", ["security_domain_id"], name: "index_task_has_security_domains_on_security_domain_id"
  add_index "task_has_security_domains", ["task_id"], name: "index_task_has_security_domains_on_task_id"

  create_table "tasks", force: true do |t|
    t.string   "task_name"
    t.string   "task_path"
    t.integer  "security_domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "search_indexed"
    t.string   "controller"
    t.string   "action"
  end

  add_index "tasks", ["security_domain_id"], name: "index_tasks_on_security_domain_id"

  create_table "transactions", force: true do |t|
    t.integer  "inventory_item_id"
    t.integer  "buyer_person_id"
    t.integer  "seller_business_id"
    t.decimal  "price"
    t.date     "transaction_date"
    t.decimal  "amount"
    t.integer  "quantity_type_id"
    t.boolean  "shopping_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transactions", ["buyer_person_id"], name: "index_transactions_on_buyer_person_id"
  add_index "transactions", ["inventory_item_id"], name: "index_transactions_on_inventory_item_id"
  add_index "transactions", ["quantity_type_id"], name: "index_transactions_on_quantity_type_id"
  add_index "transactions", ["seller_business_id"], name: "index_transactions_on_seller_business_id"

  create_table "trip_has_inventory_items", force: true do |t|
    t.integer  "trip_id"
    t.integer  "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.decimal  "amount"
    t.boolean  "packed"
    t.boolean  "reused"
  end

  add_index "trip_has_inventory_items", ["inventory_item_id"], name: "index_trip_has_inventory_items_on_inventory_item_id"
  add_index "trip_has_inventory_items", ["trip_id"], name: "index_trip_has_inventory_items_on_trip_id"

  create_table "trip_has_participants", force: true do |t|
    t.integer  "trip_id"
    t.integer  "participant_id"
    t.boolean  "organizer"
    t.boolean  "private_viewer"
    t.boolean  "traveler"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "trip_has_participants", ["participant_id"], name: "index_trip_has_participants_on_participant_id"
  add_index "trip_has_participants", ["trip_id"], name: "index_trip_has_participants_on_trip_id"

  create_table "trips", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "itinerary_item_id"
    t.string   "blog_link"
    t.string   "photo_link"
    t.string   "tripit_link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner_id"
  end

  add_index "trips", ["itinerary_item_id"], name: "index_trips_on_itinerary_item_id"

  create_table "user_has_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_has_roles", ["role_id"], name: "index_user_has_roles_on_role_id"
  add_index "user_has_roles", ["user_id"], name: "index_user_has_roles_on_user_id"

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
