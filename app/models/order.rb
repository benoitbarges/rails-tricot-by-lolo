class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  validates :amount, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :address1, presence: true
  validates :phone_number, presence: true
  validates :postcode, presence: true
  validates :city, presence: true

  monetize :amount_cents
end
