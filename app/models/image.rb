class Image < ApplicationRecord
  belongs_to :item, optional: true
  validates :image, presence: true
  mount_uploader :image, ImageUploader

  validates :image, presence: true
end
