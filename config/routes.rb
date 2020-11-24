Rails.application.routes.draw do
  
  get 'carts/show'
  get 'carts/update'
  get 'carts/destroy'
  devise_for :users
  
  root 'items#index'
  resources :items
  resources :users
  resources :carts, only: [:show, :update, :destroy]
  resources :line_items
end
