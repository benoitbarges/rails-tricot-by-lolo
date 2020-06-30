class Order < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  validates :amount, presence: true
end
