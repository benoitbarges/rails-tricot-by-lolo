class Address < ApplicationRecord
  has_many :orders

  validates :address1, :postcode, :city, :phone_number, :first_name, :last_name, :email, presence: true
end
