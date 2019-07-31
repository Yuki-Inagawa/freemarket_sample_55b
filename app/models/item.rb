class Item < ApplicationRecord
  belongs_to :user

  

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true


  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true
  validates :state, presence: true
  validates :postage_type, presence: true
  validates :region, presence: true
  validates :shopping_date, presence: true
  validates :delivery_method, presence: true

  def previous
    Item.where("id < ?", self.id).order("id DESC").first
  end

  def next
    Item.where("id > ?", self.id).order("id ASC").first
  end  
end
