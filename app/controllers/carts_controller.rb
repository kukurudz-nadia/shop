class CartsController < ApplicationController
  def show
    @cart = resource
  end

  def create
  end

  def remove_from_cart
    current_user.cart.products.destroy(params[:id])
    redirect_to cart_path
  end

  private
  def resource
    if user_signed_in?
      Product.where(id: current_user.cart.cart_products.pluck(:product_id))
    elsif session[:product_id]
      Product.where(id: session[:product_id])
    end
  end
end
