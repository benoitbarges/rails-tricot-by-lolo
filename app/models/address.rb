class Address < ApplicationRecord
  belongs_to :user

  validates :address1, :postcode, :city, :phone_number, presence: true
end
