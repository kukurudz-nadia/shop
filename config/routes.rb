Rails.application.routes.draw do
  resources :products
  resources :orders
  devise_for :users
  
  root "home#index"
end
