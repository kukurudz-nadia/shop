class DropCartProducts < ActiveRecord::Migration[7.0]
  def change
    drop_table :cart_products
  end
end
