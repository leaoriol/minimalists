Rails.application.routes.draw do

  devise_for :users
  root 'static_pages#landing' 
  
  get '/learn_more', to: 'static_pages#learn_more'
  get '/contact',    to: 'static_pages#contact'

  resources :categories
  resources :item_to_categories
  resources :items
  resources :lists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
