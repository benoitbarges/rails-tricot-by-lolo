class Product < ApplicationRecord
  CATEGORY = ["Pull", "Bonnet", "Mitaines", "Châle", "Gilet", "Chaussons", "Snood", "Col"].sort

  has_many :order_products, dependent: :destroy
  has_many_attached :photos

  validates :name, :price, :size, :description, :category, presence: true
  validates :category, inclusion: { in: CATEGORY }

  monetize :price_cents
end
