class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presence: true
  with_options presence: true, format: { with: /\A[a-z\d]{6,}\z/, message: '半角英数字を使用してください' } do
    validates :password
  end
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: '全角文字を使用してください' } do
    validates :first_name
    validates :family_name
  end
  with_options presence: true, format: { with: /\A[ァ-ヶー]+\z/, message: '全角カナを使用してください' } do
    validates :read_first
    validates :read_family
  end
  validates :birth,       presence: true

  #has_many :items
  #has_many :orders
end
