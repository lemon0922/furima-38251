class Address < ApplicationRecord
  validates :post_code,    presence: true, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :area_id,      presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :municipality, presence: true
  validates :house_num,    presence: true
  validates :phone_num,    presence: true, format: {with: /\A[0-9]{11}\z/ }

  belongs_to :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :area
end