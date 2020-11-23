Rails.application.routes.draw do
  
  devise_for :users
  
  root 'static_pages#index'
  resources :static_pages
end
