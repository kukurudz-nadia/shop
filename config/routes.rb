Rails.application.routes.draw do
  post "products/add_to_cart/:id", to: "products#add_to_cart", as: "add_to_cart"
  delete "carts/remove_from_cart/:id", to: "carts#remove_from_cart", as: "remove_from_cart"
  get 'cart', to: 'carts#show', as: :cart
  post 'cart/:id', to: 'carts#create', as: :carts
  delete "products/remove_from_session_cart/:id", to: "products#remove_from_session_cart", as: "remove_from_session_cart"

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :orders
  resources :categories
  resources :products
  
  root "home#index"
end
