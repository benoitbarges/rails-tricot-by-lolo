class Order < ApplicationRecord
  belongs_to :address
  belongs_to :user
  has_many :order_products, dependent: :destroy

  validates :amount, presence: true
end
