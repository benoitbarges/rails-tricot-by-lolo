class OrderProduct < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :product
  belongs_to :cart

  validates :quantity, :price, presence: true
end
