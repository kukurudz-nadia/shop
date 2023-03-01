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
=======
    @order = Order.create(user_id: current_user.id, status: "created", ordered_at: DateTime.current)
    current_user.cart.products.each do |item|
      @order.products << item
      current_user.cart[:id] = nil
    end
    # address = Address.new(address_params)
    # address.save
    # @order_detail = OrderDetail.new(order_detail_params)
    # @order_detail.save
    @order.save
  end

  def create
    @order = Order.new(order_params)
   
    current_user.cart.cart_products.each do |item|
      @order.cart_products << item
      item.cart_id = nil
    end
    @order.save
    Cart.destroy(session[:cart_id])
    session[:cart_id] = nil
    redirect_to root_path
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Website was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def order_params
      params.require(:order).permit()
    end
end
