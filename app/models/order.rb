class Order < ApplicationRecord
  belongs_to :address
  belongs_to :user

  validates :amount, presence: true
end
