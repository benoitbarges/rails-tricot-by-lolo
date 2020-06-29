class OrderProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product

  validates :quantity, :price, presence: true
end
