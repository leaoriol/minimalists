Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#landing' 
  
  get '/learn_more',  to: 'static_pages#learn_more'
  get '/contact',     to: 'static_pages#contact'
  get '/account',     to: 'users#account'
  get '/create_list', to: 'lists#create_list'     
  
  resources :categories
  resources :item_to_categories
  resources :items
  resources :lists do
    resources :items, only: [:create, :destroy] 
  end

  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
