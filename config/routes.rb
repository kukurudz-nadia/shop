Rails.application.routes.draw do
  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"
  post 'carts_products:id/add' => "carts_products#add_quantity", as: "carts_product_add"
  post 'carts_products/:id/reduce' => "carts_products#reduce_quantity", as: "carts_product_reduce"
  post 'carts_products' => "carts_products#create"
  get 'carts_products/:id' => "carts_products#show", as: "carts_product"
  delete 'carts_products/:id' => "carts_products#destroy"
  resources :products
  resources :orders
  devise_for :users
  
  root "home#index"
end
