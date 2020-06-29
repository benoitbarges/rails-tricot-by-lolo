class Order < ApplicationRecord
  belongs_to :address
  belongs_to :user
  belongs_to :cart
  has_many :order_products

  validates :amount, presence: true
end
