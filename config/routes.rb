Rails.application.routes.draw do
  get 'order_details/new'
  get 'order_details/show'
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  resources :categories
  resources :products
  resources :orders
  devise_for :users
  root "home#index"
end
