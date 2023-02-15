Rails.application.routes.draw do
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  post "products/add_from_session_to_db", to: "products#add_from_session_to_db", as: "add_from_session_to_db"
  delete "carts/remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from_cart"
  resources :categories
  resources :products
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'cart', to: 'carts#show', as: :cart
  post 'cart/:id', to: 'carts#create', as: :carts
  resources :orders
  # get 'order', to: 'orders#show', as: :order
  # post 'order', to: 'orders#create', as: :orders
  delete 'cart/:id', to:'carts#destroy', as: :cart_product
  resources :orders
  root "home#index"
end
