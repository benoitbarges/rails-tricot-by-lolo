class Order < ApplicationRecord
  belongs_to :address
  belongs_to :user
  belongs_to :cart
  has_many :order_products, through: :carts

  validates :amount, presence: true
end
