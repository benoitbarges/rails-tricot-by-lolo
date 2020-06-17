class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products

  validates :name, :price, :size, :description, presence: true
end
