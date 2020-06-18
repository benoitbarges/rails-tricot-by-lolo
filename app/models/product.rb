class Product < ApplicationRecord
  belongs_to :category
  has_many :order_products
  has_one_attached :photos

  validates :name, :price, :size, :description, :category, presence: true
end
