Rails.application.routes.draw do
  
  devise_for :users
  
  root 'items#index'
  resources :items
  resources :users
  resources :carts
  resources :line_items
end
