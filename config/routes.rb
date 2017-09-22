Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#landing' 
  
  get '/learn_more',  to: 'static_pages#learn_more'
  get '/contact',     to: 'static_pages#contact'
  get '/account',     to: 'users#account'
  get '/users/session_switch', to: 'users#session_switch', as: 'session_switch'
  # get '/create_list', to: 'lists#create_list'   
  get "lists/update_item" => 'lists#update_item', :as => :update_item
  
  
  resources :categories
  resources :item_to_categories
  resources :items
  resources :goals
  resources :lists do
    resources :items, only: [:create, :destroy] 
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
