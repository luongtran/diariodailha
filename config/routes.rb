Diariodailha::Application.routes.draw do

  put "contents_photo/:id" => "contents_photos#update"
  
  get "contents_photo/:id" => "contents_photos#show", :as => "contents_photo"

  delete "contents_photo/:id" => "contents_photos#destroy"

  get "contents_photos/new"

  post "contents_photos" => "contents_photos#create"

  get "contents_photos" => "contents_photos#index"

  get "contents_photos/upload_images/:content_id" => "contents_photos#upload_images", :as => "content_upload_images"
  
  get "contents_photos/view_photos/:content_id" => "contents_photos#view_photos", :as => "content_view_photos"
  
  get "contents_photos/edit/:id" => "contents_photos#edit", :as => "edit_contents_photo"



  put "news_photo/:id" => "news_photos#update"
  
  get "news_photo/:id" => "news_photos#show", :as => "news_photo"

  delete "news_photo/:id" => "news_photos#destroy"

  get "news_photos/new"

  post "news_photos" => "news_photos#create"

  get "news_photos" => "news_photos#index"

  get "news_photos/upload_images/:message_id" => "news_photos#upload_images", :as => "upload_images"
  
  get "news_photos/view_photos/:message_id" => "news_photos#view_photos", :as => "message_view_photos"
  
  get "news_photos/edit/:id" => "news_photos#edit", :as => "edit_news_photo"

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
  get "/sale/:photo_id/remove_photo" => "sales#remove_photo", :as => "sale_remove_photo"

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
