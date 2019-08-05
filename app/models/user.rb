class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
          :recoverable, :rememberable, :validatable

  has_many :items
  has_many :addresses
  has_many :comments

  validates :nickname, presence: true, length: { maximum: 20 }
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :password, presence: true, length: { in: 6..128 }, confirmation: true
  validates :password_confirmation, presence: true, length: { in: 6..128 }
  validates :family_name, presence: true, length: { maximum: 35 }
  validates :farst_name, presence: true, length: { maximum: 35 }
  validates :family_name_ruby, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }, length: { maximum: 35 }
  validates :farst_name_ruby, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }, length: { maximum: 35 }
  validates :birthday_yiar, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true

end
