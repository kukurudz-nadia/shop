class CartsController < ApplicationController
  def show
    @cart = resource
  end

  def create
  end

  def destroy
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
