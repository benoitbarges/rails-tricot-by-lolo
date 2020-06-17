class Product < ApplicationRecord
  has_one :category
  has_many :order_products

  validates :name, :price, :size, :description, presence: true
end
