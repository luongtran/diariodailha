Diariodailha::Application.routes.draw do

  #resources :sale_items

  get "/photographers/:id/authorize" => "photographers#authorize", :as => "photographer_authorize"

  get "/photographers/:id/deny" => "photographers#deny", :as => "photographer_deny"

  get "/photographers/show_albums" => "photographers#show_albums", :as => "photographer_show_albums"

  match "photographers" => "photographers#index"

  resources :photo_lists

  resources :sales

  resources :contact_types

  resources :contacts

  resources :work_with_us

  resources :albums do
    get "show_photos" => "albums#show_photos"
    get "add_photo" => "albums#add_photo"
  end

  mount Ckeditor::Engine => '/ckeditor'

  resources :contents

  resources :abouts

  devise_for :users, :controllers => {:registrations => 'Users::Registrations', :sessions => 'Users::Sessions', :mailer => 'Users::Mailer', :passwords => 'Users::Passwords', :confirmations => 'Users::Confirmations' }

  get "site/index"
  get "site/terms"
  get "site/about"
  get "site/admin_page"
  get "site/work_with_us"
  get "site/advertise"
  get "site/how_buy"
  
  
  get "site/how_to_buy_photos"
  
  resources :photos
  match "find_photos" => "photos#find_photos"
  match 'find_result' => "photos#find_result"

  devise_for :photographers, :controllers => {:registrations => 'Photographers::Registrations', :sessions => 'Photographers::Sessions', :mailer => 'Photographers::Mailer', :passwords => 'Photographers::Passwords', :confirmations => 'Photographers::Confirmations' }

  root :to => 'site#index'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
