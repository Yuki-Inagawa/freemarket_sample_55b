class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :addresses
  has_many :comments

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :farst_name, presence: true
  validates :family_name_ruby, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :farst_name_ruby, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday_yiar, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  validates :email, presence: true, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :encrypted_password, presence: true
end
