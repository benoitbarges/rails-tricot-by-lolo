class Address < ApplicationRecord
  belongs_to :user
  has_many :orders

  validates :address1, :postcode, :city, :phone_number, presence: true
end