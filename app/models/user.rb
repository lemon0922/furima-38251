class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,         presence: true
  validates :password,         format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/, message: '半角英数字を使用してください' }
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: 'カタカナを使用してください' } do
    validates :read_first
    validates :read_family
  end
  validates :birth, presence: true

  has_many :items
  has_many :orders
end
