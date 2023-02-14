class Order < ApplicationRecord
  belongs_to :user
  has_one :order_detail, dependent: :destroy
  has_many :product_orders, dependent: :destroy
  has_many :products, through: :product_orders
end
