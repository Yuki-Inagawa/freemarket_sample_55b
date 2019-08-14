class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :omniauthable,omniauth_providers: [:facebook, :google_oauth2]

  has_many :items
  has_many :addresses
  has_many :comments
  has_many :likes
  has_many :transactions

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


  def self.find_oauth(auth)
    # snsのユーザーのidとproviderを変数に代入
    uid = auth.uid
    provider = auth.provider
    # DBにすでにsns情報を保存しているユーザーのuidとproviderを代入
    snscredential = SnsCredential.where(uid: uid, provider: provider).first
    # DBにすでに存在していればそのユーザーを探してそのユーザーを返す
    if snscredential.present?
      user = User.where(id: snscredential.user_id).first
    else
    # snsでのアプリへの登録はないがsns上のemailと同一のemailアドレスを持つユーザーの場合はsnsの情報をsnsCredentialsテーブルに追加
      user = User.where(email: auth.info.email).first
      if user.present?
        SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
          )
      else
    # snsでの登録もユーザーの登録もない場合はnilを返す
        user = nil
      end
    end
    return user
  end

end

# みんなのパソコンがおかしい

