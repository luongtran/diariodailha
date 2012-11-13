Diariodailha::Application.routes.draw do

  resources :marquees

  resources :prices

  resources :banners

  resources :messages do 
    get "contrast_message" => "messages#contrast_message"
  end

  #resources :sale_items

  get "/photographers/:id/authorize" => "photographers#authorize", :as => "photographer_authorize"
  get "/photographers/:id/deny" => "photographers#deny", :as => "photographer_deny"
  get "/photographers/show_albums" => "photographers#show_albums", :as => "photographer_show_albums"
  match "photographers/index" => "photographers#index"

  resources :photo_lists

  resources :sales

  get "/sales/:photo_id/add_photo" => "sales#add_photo", :as => "sale_add_photo" 
  post "/sale/finish_sale" => "sales#finish_sale", :as => "sale_finish_sale"
  get "/sale/view_sale" => "sales#view_sale", :as => "sale_view_sale"

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

  devise_for :users, :controllers => {:registrations => 'Users::Registrations', :sessions => 'Users::Sessions', :passwords => 'Users::Passwords', :confirmations => 'Users::Confirmations' }

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

  devise_for :photographers, :controllers => {:registrations => 'Photographers::Registrations', :sessions => 'Photographers::Sessions', :passwords => 'Photographers::Passwords', :confirmations => 'Photographers::Confirmations' }

  root :to => 'site#index'
end
