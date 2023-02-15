class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
    @order = Order.new
    @order.build_order_detail
    @order.order_detail.build_address
  end

  def create
    if user_signed_in?
      @order = Order.create(status: "completed", ordered_at: Date.today, user_id: current_user.id)
      @address = Address.create(
        country: order_params[:order_detail_attributes][:address_attributes][:country],
        city: order_params[:order_detail_attributes][:address_attributes][:city],
        street: order_params[:order_detail_attributes][:address_attributes][:street],
        comment: order_params[:order_detail_attributes][:address_attributes][:comment],
        user_id: current_user.id
      )
      @order_detail = OrderDetail.create(
        first_name: order_params[:order_detail_attributes][:first_name],
        last_name: order_params[:order_detail_attributes][:last_name],
        email: order_params[:order_detail_attributes][:email],
        order_id: @order.id,
        address_id: @address.id
      )
    else
      @order = Order.create(status: "completed", ordered_at: Date.today)
      @address = Address.create(
        country: order_params[:order_detail_attributes][:address_attributes][:country],
        city: order_params[:order_detail_attributes][:address_attributes][:city],
        street: order_params[:order_detail_attributes][:address_attributes][:street],
        comment: order_params[:order_detail_attributes][:address_attributes][:comment]
      )
      @order_detail = OrderDetail.create(
        first_name: order_params[:order_detail_attributes][:first_name],
        last_name: order_params[:order_detail_attributes][:last_name],
        email: order_params[:order_detail_attributes][:email],
        order_id: @order.id,
        address_id: @address.id
      )
    end
   
    redirect_to orders_path
  end

  def index
    flash[:success] = "Order has been successfully created!"
  end

  private
  def resource
    current_user.orders.find(params[:id])
  end

  def order_params
   params.require(:order).permit(order_detail_attributes: [:first_name, :last_name, :email, address_attributes: [:country, :city, :street, :comment]])
  end
end