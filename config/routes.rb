Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  
  resources :items
  resources :users
  resources :orders, only: [:create, :new]
  resources :carts, only: [:show, :update]
  resources :line_items, only: [:create, :update, :destroy]
end
