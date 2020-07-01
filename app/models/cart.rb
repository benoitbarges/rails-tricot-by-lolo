class Cart < ApplicationRecord
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products
  belongs_to :user, optional: true

  def sub_total
    sum = 0
    self.order_products.each do |order_product|
      sum += order_product.product.price
    end
    return sum
  end
end
