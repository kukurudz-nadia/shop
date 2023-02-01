class ProductsController < ApplicationController
  def index
    @products = collection
  end

  def show
    @product = resource
  end

  def add_to_cart
    id = params[:id]
    session[:cart] << id unless session[:cart].include?(id)
    redirect_to products_path
  end

  def remove_from_cart
    session[:cart].delete(id)
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
