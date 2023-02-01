class Order < ApplicationRecord
  belongs_to :user
  has_one :order_detail
  has_many :product_orders
  has_many :orders, through: :product_orders
end
