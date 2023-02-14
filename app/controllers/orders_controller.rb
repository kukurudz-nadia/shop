class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def new
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

    # def order_detail_params
    #   params.require(:order_detail).permit(:first_name, :last_name, :email, address_id: address.id, order_id: @order.id)
    # end

    # def address_params
    #   params.require(:address).permit(:street, :city, :coutry, :comment, user_id: current_user.id)
    # end
end
