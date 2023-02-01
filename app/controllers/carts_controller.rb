class CartsController < ApplicationController
  def create; end

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
