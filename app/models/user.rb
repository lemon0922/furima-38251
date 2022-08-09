class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname,    presence: true
  validates :first_name,  presence: true
  validates :family_name, presence: true
  validates :read_first,  presence: true
  validates :read_family, presence: true
  validates :birth,       presence: true

  has_many :items
  has_many :orders
end
