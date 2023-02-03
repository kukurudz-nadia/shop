class Product < ApplicationRecord
  validates :price, :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :category
  has_many :cart_products, dependent: :destroy
  has_many :carts, through: :cart_products
  has_many :product_orders, dependent: :destroy
  has_many :orders, through: :product_orders

  scope :ordered, -> { order(position: :desc) }
end
