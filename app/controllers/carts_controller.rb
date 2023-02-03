class CartsController < ApplicationController
  def show
    @cart = resource
  end

  private

  def resource
    if user_signed_in?
      current_user.cart
    else
      session[:cart]
    end
  end
end
