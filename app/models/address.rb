class Address < ApplicationRecord
  include ActiveModel::Validations

  # attr_accessor :address_id

  belongs_to :user

  validates :postal_code, presence: true, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ } 
  validates :region, presence: true
  validates :city, presence: true
  validates :address_number, presence: true
end
