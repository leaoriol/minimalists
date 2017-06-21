Rails.application.routes.draw do
  get 'static_pages/learn_more'

  get 'static_pages/contact'

  resources :categories
  resources :item_to_categories
  resources :items
  resources :lists
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#contact' #this should be changed eventually to home
end
