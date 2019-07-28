class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :addresses

  validates :nickname, presence: true
  validates :family_name, presence: true
  validates :first_name, presence: true
  validates :family_name_ruby, presence: true
  validates :first_name_ruby, presence: true
  validates :birthday_yiar, presence: true
  validates :birthday_month, presence: true
  validates :birthday_day, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
