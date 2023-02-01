class Product < ApplicationRecord
  validates :price, :name, presence: true
  validates :price, numericality: { greater_than: 0 }

  belongs_to :category
  has_and_belongs_to_many :orders

  scope :ordered, -> { order(position: :desc) }
end
