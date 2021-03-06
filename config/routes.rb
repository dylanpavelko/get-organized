Rails.application.routes.draw do
  resources :inventory_options

  resources :planned_meals

  resources :activity_aspect_has_event_details

  resources :event_aspect_has_event_details

  resources :event_details

  resources :event_activity_has_agenda_items

  resources :event_agenda_items

  resources :event_activity_has_aspects

  resources :event_template_has_event_activities

  resources :event_activities

  resources :event_has_aspects

  resources :event_template_has_aspects

  resources :planning_aspects

  resources :event_templates

  resources :event_types

  resources :stock_sales

  resources :stock_purchases

  resources :stock_purchase_types

  resources :stock_award_vestings

  resources :stock_awards

  resources :stock_award_types

  resources :stocks

  resources :pictures

  resources :recipe_ingredients

  resources :food_items

  resources :recipe_steps

  resources :recipes

  resources :public_inventory_item_queues

  resources :trip_has_participants

  resources :attraction_has_reviews

  resources :reviews

  resources :comments

  resources :businesses

  resources :transactions

  resources :user_has_roles

  resources :security_domain_has_roles

  resources :roles

  resources :task_has_security_domains

  resources :security_domains

  resources :tasks

  resources :inventory_owners

  resources :people

  resources :hotel_chains

  resources :airlines

  resources :loyalty_programs

  get 'trip_has_inventory_items/select_trips_to_copy'

  get 'trip_has_inventory_items/select_items_to_copy'

  post '/trip_has_inventory_items/copy_selected_items_to_trip'

  post '/recipes/sync_recipe'

  get 'sessions/login'

  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'users/new'

  resources :locations

  resources :itinerary_activities do
    resources :tasks
  end

  resources :attractions

  resources :attraction_categories

  resources :activity_has_exercise_centers

  resources :exercise_centers

  resources :quantity_types

  resources :subcategories

  resources :categories

  resources :trip_has_inventory_items

  resources :trips

  get 'my_inventory' => 'inventory_items#my_inventory'

  post 'trips/add_item' => 'trips#add_item_to_trip'

  post 'inventory_items/publish' => 'inventory_items#publish'
  
  post 'trips/pack_item' => 'trip_has_inventory_items#pack_item'
  
  post 'trips/pack_item_multiple' => 'trip_has_inventory_items#pack_item_multiple'
  
  get 'my_trips' => 'trips#my_trips'

  post 'instant_search_inventory' => 'inventory_items#instant_search_inventory'

  post 'search' => 'people#header_search'

  resources :activity_has_inventory_items

  resources :activities

  resources :inventory_items

  resources :users

  
  get 'sessions/login'
  post 'sessions/login'
  get "logout" => "sessions#logout"
  get 'sessions/home'

  get 'sessions/profile'

  get 'sessions/setting'

  get 'users/new'

  post ':controller(/:action(/:id))(.:format)'

  get 'welcome/index'

  root 'welcome#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
