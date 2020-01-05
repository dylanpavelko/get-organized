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

ActiveRecord::Schema.define(version: 2020_01_05_051509) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "activities", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "activity_aspect_has_event_details", force: :cascade do |t|
    t.integer "activity_aspect_id"
    t.integer "event_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activity_aspect_id"], name: "index_activity_aspect_has_event_details_on_activity_aspect_id"
    t.index ["event_detail_id"], name: "index_activity_aspect_has_event_details_on_event_detail_id"
  end

  create_table "activity_has_exercise_centers", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "exercise_center_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activity_id"], name: "index_activity_has_exercise_centers_on_activity_id"
    t.index ["exercise_center_id"], name: "index_activity_has_exercise_centers_on_exercise_center_id"
  end

  create_table "activity_has_inventory_items", force: :cascade do |t|
    t.integer "activity_id"
    t.integer "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activity_id"], name: "index_activity_has_inventory_items_on_activity_id"
    t.index ["inventory_item_id"], name: "index_activity_has_inventory_items_on_inventory_item_id"
  end

  create_table "airlines", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "loyalty_program_id"
    t.string "image", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["loyalty_program_id"], name: "index_airlines_on_loyalty_program_id"
  end

  create_table "attraction_categories", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attraction_has_reviews", force: :cascade do |t|
    t.integer "attraction_id"
    t.integer "review_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attraction_id"], name: "index_attraction_has_reviews_on_attraction_id"
    t.index ["review_id"], name: "index_attraction_has_reviews_on_review_id"
  end

  create_table "attractions", force: :cascade do |t|
    t.integer "attraction_category_id"
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "trip_advisor_link", limit: 255
    t.integer "location_id"
    t.integer "hotel_id"
    t.index ["attraction_category_id"], name: "index_attractions_on_attraction_category_id"
    t.index ["hotel_id"], name: "index_attractions_on_hotel_id"
    t.index ["location_id"], name: "index_attractions_on_location_id"
  end

  create_table "businesses", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: :cascade do |t|
    t.string "category", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "reply_to_id"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["author_id"], name: "index_comments_on_author_id"
    t.index ["reply_to_id"], name: "index_comments_on_reply_to_id"
  end

  create_table "event_activities", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_activity_has_agenda_items", force: :cascade do |t|
    t.integer "event_activity_id"
    t.integer "event_agenda_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_activity_id"], name: "index_event_activity_has_agenda_items_on_event_activity_id"
    t.index ["event_agenda_item_id"], name: "index_event_activity_has_agenda_items_on_event_agenda_item_id"
  end

  create_table "event_activity_has_aspects", force: :cascade do |t|
    t.integer "event_activity_id"
    t.integer "planning_aspect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_activity_id"], name: "index_event_activity_has_aspects_on_event_activity_id"
    t.index ["planning_aspect_id"], name: "index_event_activity_has_aspects_on_planning_aspect_id"
  end

  create_table "event_agenda_items", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_aspect_has_event_details", force: :cascade do |t|
    t.integer "activity_aspect_id"
    t.integer "event_detail_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activity_aspect_id"], name: "index_event_aspect_has_event_details_on_activity_aspect_id"
    t.index ["event_detail_id"], name: "index_event_aspect_has_event_details_on_event_detail_id"
  end

  create_table "event_details", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "event_has_aspects", force: :cascade do |t|
    t.integer "event_id"
    t.integer "planning_aspect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], name: "index_event_has_aspects_on_event_id"
    t.index ["planning_aspect_id"], name: "index_event_has_aspects_on_planning_aspect_id"
  end

  create_table "event_template_has_aspects", force: :cascade do |t|
    t.integer "event_id"
    t.integer "planning_aspect_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_id"], name: "index_event_template_has_aspects_on_event_id"
    t.index ["planning_aspect_id"], name: "index_event_template_has_aspects_on_planning_aspect_id"
  end

  create_table "event_template_has_event_activities", force: :cascade do |t|
    t.integer "event_id"
    t.integer "activities_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["activities_id"], name: "index_event_template_has_event_activities_on_activities_id"
    t.index ["event_id"], name: "index_event_template_has_event_activities_on_event_id"
  end

  create_table "event_templates", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "event_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["event_type_id"], name: "index_event_templates_on_event_type_id"
  end

  create_table "event_types", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercise_centers", force: :cascade do |t|
    t.string "gymType", limit: 255
    t.string "name", limit: 255
    t.string "site", limit: 255
    t.text "notes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_items", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "pounds_per_cup"
  end

  create_table "hotel_chains", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "loyalty_program_id"
    t.string "image", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["loyalty_program_id"], name: "index_hotel_chains_on_loyalty_program_id"
  end

  create_table "inventory_items", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "quantity_type_id"
    t.boolean "consumable"
    t.decimal "price"
    t.text "note"
    t.text "detail"
    t.string "brand", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "category_id"
    t.integer "subcategory_id"
    t.text "amazon_link", limit: 255
    t.boolean "container"
    t.boolean "public"
    t.index ["category_id"], name: "index_inventory_items_on_category_id"
    t.index ["quantity_type_id"], name: "index_inventory_items_on_quantity_type_id"
    t.index ["subcategory_id"], name: "index_inventory_items_on_subcategory_id"
  end

  create_table "inventory_options", force: :cascade do |t|
    t.integer "inventory_item_id"
    t.integer "food_items_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["food_items_id"], name: "index_inventory_options_on_food_items_id"
    t.index ["inventory_item_id"], name: "index_inventory_options_on_inventory_item_id"
  end

  create_table "inventory_owners", force: :cascade do |t|
    t.integer "inventory_item_id"
    t.decimal "amount"
    t.integer "quantity_type_id"
    t.integer "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "stored_in_id"
    t.index ["inventory_item_id"], name: "index_inventory_owners_on_inventory_item_id"
    t.index ["person_id"], name: "index_inventory_owners_on_person_id"
    t.index ["quantity_type_id"], name: "index_inventory_owners_on_quantity_type_id"
    t.index ["stored_in_id"], name: "index_inventory_owners_on_stored_in_id"
  end

  create_table "itinerary_activities", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "attraction_id"
    t.decimal "cost"
    t.integer "basis_id"
    t.datetime "datetime"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "trip_id"
    t.integer "origination_id"
    t.integer "destination_id"
    t.integer "airline_id"
    t.datetime "end"
    t.text "note"
    t.index ["airline_id"], name: "index_itinerary_activities_on_airline_id"
    t.index ["attraction_id"], name: "index_itinerary_activities_on_attraction_id"
    t.index ["basis_id"], name: "index_itinerary_activities_on_basis_id"
    t.index ["destination_id"], name: "index_itinerary_activities_on_destination_id"
    t.index ["origination_id"], name: "index_itinerary_activities_on_origination_id"
    t.index ["trip_id"], name: "index_itinerary_activities_on_trip_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "name", limit: 255
    t.integer "timezonen_id"
    t.string "street_address", limit: 255
    t.string "street_address2", limit: 255
    t.string "city", limit: 255
    t.string "state", limit: 255
    t.string "zipcode", limit: 255
    t.string "country", limit: 255
    t.decimal "longitude"
    t.decimal "latitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "airport"
    t.index ["timezonen_id"], name: "index_locations_on_timezonen_id"
  end

  create_table "loyalty_programs", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "number", limit: 255
    t.string "username", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "image", limit: 255
  end

  create_table "people", force: :cascade do |t|
    t.string "first_name", limit: 255
    t.string "nick_name", limit: 255
    t.string "last_name", limit: 255
    t.integer "user_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_account_id"], name: "index_people_on_user_account_id"
  end

  create_table "pictures", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "image_file_name", limit: 255
    t.string "image_content_type", limit: 255
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "planned_meals", force: :cascade do |t|
    t.date "meal_date"
    t.integer "meal_type"
    t.string "text", limit: 255
    t.boolean "eat_out"
    t.string "url", limit: 255
    t.integer "recipe_id"
    t.integer "attraction_id"
    t.boolean "left_overs"
    t.integer "planned_meal_id"
    t.integer "food_item_id"
    t.text "comment"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attraction_id"], name: "index_planned_meals_on_attraction_id"
    t.index ["food_item_id"], name: "index_planned_meals_on_food_item_id"
    t.index ["planned_meal_id"], name: "index_planned_meals_on_planned_meal_id"
    t.index ["recipe_id"], name: "index_planned_meals_on_recipe_id"
  end

  create_table "planning_aspects", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "event_type_id"
    t.integer "event_activity_id"
    t.index ["event_activity_id"], name: "index_planning_aspects_on_event_activity_id"
    t.index ["event_type_id"], name: "index_planning_aspects_on_event_type_id"
  end

  create_table "public_inventory_item_queues", force: :cascade do |t|
    t.integer "item_id"
    t.boolean "reviewed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["item_id"], name: "index_public_inventory_item_queues_on_item_id"
  end

  create_table "quantity_types", force: :cascade do |t|
    t.string "quantityType", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "recipe_id"
    t.string "amount", limit: 255
    t.integer "quantity_type_id"
    t.integer "food_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "note"
    t.index ["food_item_id"], name: "index_recipe_ingredients_on_food_item_id"
    t.index ["quantity_type_id"], name: "index_recipe_ingredients_on_quantity_type_id"
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id"
  end

  create_table "recipe_steps", force: :cascade do |t|
    t.integer "recipe_id"
    t.text "instruction"
    t.integer "order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["recipe_id"], name: "index_recipe_steps_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name", limit: 255
    t.string "serving_size", limit: 255
    t.text "description"
    t.string "source", limit: 255
    t.text "notes"
    t.integer "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "picture_id"
    t.index ["author_id"], name: "index_recipes_on_author_id"
    t.index ["picture_id"], name: "index_recipes_on_picture_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.integer "comment_id"
    t.integer "reviewer_id"
    t.boolean "public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["comment_id"], name: "index_reviews_on_comment_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "security_domain_has_roles", force: :cascade do |t|
    t.integer "domain_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["domain_id"], name: "index_security_domain_has_roles_on_domain_id"
    t.index ["role_id"], name: "index_security_domain_has_roles_on_role_id"
  end

  create_table "security_domains", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_award_types", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_award_vestings", force: :cascade do |t|
    t.integer "stock_award_id"
    t.date "vest_date"
    t.integer "vest_quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["stock_award_id"], name: "index_stock_award_vestings_on_stock_award_id"
  end

  create_table "stock_awards", force: :cascade do |t|
    t.integer "person_id"
    t.integer "stock_id"
    t.integer "award_type_id"
    t.date "award_date"
    t.integer "shares"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "award_id", limit: 255
    t.decimal "grant_price"
    t.index ["person_id"], name: "index_stock_awards_on_person_id"
    t.index ["stock_id"], name: "index_stock_awards_on_stock_id"
  end

  create_table "stock_purchase_types", force: :cascade do |t|
    t.string "name", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "stock_purchases", force: :cascade do |t|
    t.integer "person_id"
    t.integer "stock_id"
    t.integer "stock_purchase_type_id"
    t.integer "stock_award_id"
    t.date "grant_date"
    t.decimal "grant_date_price"
    t.integer "shares"
    t.date "acquired_date"
    t.decimal "acquired_price"
    t.decimal "acquired_fmv"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["person_id"], name: "index_stock_purchases_on_person_id"
    t.index ["stock_award_id"], name: "index_stock_purchases_on_stock_award_id"
    t.index ["stock_id"], name: "index_stock_purchases_on_stock_id"
    t.index ["stock_purchase_type_id"], name: "index_stock_purchases_on_stock_purchase_type_id"
  end

  create_table "stock_sales", force: :cascade do |t|
    t.integer "person_id"
    t.integer "stock_id"
    t.integer "stock_purchase_id"
    t.integer "stock_award_id"
    t.date "trade_date"
    t.decimal "price"
    t.integer "shares"
    t.decimal "fees"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "stock_award_vesting_id"
    t.index ["person_id"], name: "index_stock_sales_on_person_id"
    t.index ["stock_award_id"], name: "index_stock_sales_on_stock_award_id"
    t.index ["stock_award_vesting_id"], name: "index_stock_sales_on_stock_award_vesting_id"
    t.index ["stock_id"], name: "index_stock_sales_on_stock_id"
    t.index ["stock_purchase_id"], name: "index_stock_sales_on_stock_purchase_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.integer "business_id"
    t.string "symbol", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["business_id"], name: "index_stocks_on_business_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string "subcategory", limit: 255
    t.integer "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["category_id"], name: "index_subcategories_on_category_id"
  end

  create_table "task_has_security_domains", force: :cascade do |t|
    t.integer "task_id"
    t.integer "security_domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["security_domain_id"], name: "index_task_has_security_domains_on_security_domain_id"
    t.index ["task_id"], name: "index_task_has_security_domains_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "task_name", limit: 255
    t.string "task_path", limit: 255
    t.integer "security_domain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "search_indexed"
    t.string "controller", limit: 255
    t.string "action", limit: 255
    t.index ["security_domain_id"], name: "index_tasks_on_security_domain_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "inventory_item_id"
    t.integer "buyer_person_id"
    t.integer "seller_business_id"
    t.decimal "price"
    t.date "transaction_date"
    t.decimal "amount"
    t.integer "quantity_type_id"
    t.boolean "shopping_list"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["buyer_person_id"], name: "index_transactions_on_buyer_person_id"
    t.index ["inventory_item_id"], name: "index_transactions_on_inventory_item_id"
    t.index ["quantity_type_id"], name: "index_transactions_on_quantity_type_id"
    t.index ["seller_business_id"], name: "index_transactions_on_seller_business_id"
  end

  create_table "trip_has_inventory_items", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "inventory_item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date "date"
    t.decimal "amount"
    t.boolean "packed"
    t.boolean "reused"
    t.index ["inventory_item_id"], name: "index_trip_has_inventory_items_on_inventory_item_id"
    t.index ["trip_id"], name: "index_trip_has_inventory_items_on_trip_id"
  end

  create_table "trip_has_participants", force: :cascade do |t|
    t.integer "trip_id"
    t.integer "participant_id"
    t.boolean "organizer"
    t.boolean "private_viewer"
    t.boolean "traveler"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["participant_id"], name: "index_trip_has_participants_on_participant_id"
    t.index ["trip_id"], name: "index_trip_has_participants_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.string "name", limit: 255
    t.text "description"
    t.string "blog_link", limit: 255
    t.string "photo_link", limit: 255
    t.string "tripit_link", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "owner_id"
  end

  create_table "user_has_roles", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["role_id"], name: "index_user_has_roles_on_role_id"
    t.index ["user_id"], name: "index_user_has_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username", limit: 255
    t.string "email", limit: 255
    t.string "encrypted_password", limit: 255
    t.string "salt", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "power_admin"
  end

end
