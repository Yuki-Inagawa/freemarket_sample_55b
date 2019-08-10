class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  belongs_to :category
  has_many :likes, dependent: :destroy


  

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true


  validates :name, presence: true, length: { maximum: 40 }
  validates :text, presence: true, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
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

  def like_user(user_id)
    likes.find_by(user_id: user.id)
  end

end
