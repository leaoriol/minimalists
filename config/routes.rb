Rails.application.routes.draw do
  get 'static_pages/learn_more'

  get 'static_pages/help'

  resources :categories
  resources :item_to_categories
  resources :items
  resources :lists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'users#index'
end
