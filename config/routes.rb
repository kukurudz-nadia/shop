Rails.application.routes.draw do
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  post "products/add_from_session_to_db", to: "products#add_from_session_to_db", as: "add_from_session_to_db"
  delete "products/remove_from_cart/:id", to: "products#remove_from_cart", as: "remove_from_cart"
  resources :categories
  resources :products
  resources :orders
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'cart', to: 'carts#show', as: :cart
  post 'cart/:id', to: 'carts#create', as: :carts
  delete 'cart/:id', to:'carts#destroy', as: :cart_product
  root "home#index"
end
