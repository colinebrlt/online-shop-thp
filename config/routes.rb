Rails.application.routes.draw do
  root 'items#index'

  devise_for :users
  
  resources :items
  
  resources :users
  resolve('profil') { [:users] }
  resources :orders, only: [:create, :new, :show]
  resources :carts, only: [:show, :update]
  resources :line_items, only: [:create, :update, :destroy]
end
