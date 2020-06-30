class Cart < ApplicationRecord
  has_many :order_products
end
