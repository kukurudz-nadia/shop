class Category < ApplicationRecord
  validates :name, :position, presence: true, uniqueness: true
  has_many :products, dependent: :destroy

  scope :ordered, -> { order(position: :desc) }
end
