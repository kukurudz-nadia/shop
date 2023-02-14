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
    
    session[:product_ids] << params[:id]
    redirect_to products_path
  end

  def remove_from_cart
    session[:product_ids].delete(params[:id])
    #     current_user.cart.cart_products[:product_ids].delete(params[:id].to_i)
    redirect_to products_path
  end

  private

  def collection
    Product.ordered
  end

  def resource
    collection.find(params[:id])
  end
end
