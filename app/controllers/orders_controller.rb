class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    if @order.save
      redirect_to orders_path, notice: "Order was successfully created."
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Order was successfully destroyed."
  end

  private

  def order_params
    params.require(:order).permit(:status, :ordered_at)
  end
end
