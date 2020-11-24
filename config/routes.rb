Rails.application.routes.draw do
  
  devise_for :users
  
  root 'items#index'
  resources :items
  resources :users
  resources :charges, only: [:create, :new] # A changer ?
end
