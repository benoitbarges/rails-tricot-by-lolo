class Cart < ApplicationRecord
  belongs_to :user
  has_one :order
  has_many :order_products
end
