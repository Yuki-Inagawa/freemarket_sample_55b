class Item < ApplicationRecord
  belongs_to :user

  

  has_many :images
  accepts_nested_attributes_for :images


  validates :name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :state, presence: true
  validates :postage_type, presence: true
  validates :region, presence: true
  validates :shopping_date, presence: true
  validates :delivery_method, presence: true
end
