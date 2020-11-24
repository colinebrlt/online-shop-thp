Rails.application.routes.draw do
  
  get 'line_items/create'
  get 'line_items/update'
  get 'line_items/destroy'
  get 'carts/show'
  get 'carts/update'
  get 'carts/destroy'
  devise_for :users
  
  root 'items#index'
  resources :items
  resources :users
  resources :charges, only: [:create, :new] # A changer ?
  resources :carts, only: [:show, :update]
  resources :line_items, only: [:create, :update, :destroy]
end
