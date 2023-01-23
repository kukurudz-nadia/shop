class OrderDetailsController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_details_params)

    if @order.save
      redirect_to orders_path, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def show
  end

  private

  def order_details_params
    params.require(:order_details).permit(:first_name, :last_name, :email)
  end
end
