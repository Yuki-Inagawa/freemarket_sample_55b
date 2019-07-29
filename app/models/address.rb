class Address < ApplicationRecord
  belongs_to :user

  validates :postal_code, presence: true
  validates :region, presence: true
  validates :city, presence: true
  validates :address_number, presence: true
end
