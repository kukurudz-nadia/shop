Rails.application.routes.draw do
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  resources :categories
  resources :products
  resources :orders
  resources :carts
  devise_for :users
  root "home#index"
end
