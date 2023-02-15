class ProductsController < ApplicationController
  def index
    if params[:id]
      @products = collection.where(category_id: params[:id])
    else
      @products = collection
    end
  end

  def show
    @product = resource
  end

  def add_to_cart
    if session[:product_ids].nil?
      session[:product_ids] = [] 
    end
    
    if user_signed_in?
      session[:product_ids].each do |product_id|
        current_cart_products = CartProduct.create(cart_id: current_user.cart.id, product_id: product_id)
      end
    else
      session[:product_ids] << params[:id]
    end
    redirect_to products_path
  end

  def remove_from_session_cart
    session[:product_ids].delete(params[:id])
    redirect_to cart_path
  end

  private
  def collection
    Product.ordered
  end

  def resource
    collection.find(params[:id])
  end
end
