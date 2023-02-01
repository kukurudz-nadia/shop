class DropProductOrders < ActiveRecord::Migration[7.0]
  def change
    drop_table :product_orders
  end
end
