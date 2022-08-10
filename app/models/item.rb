class Item < ApplicationRecord
  validates :title,            presence: true
  validates :content,          presence: true
  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_date_id,numericality: { other_than: 1, message: "can't be blank" }
  validates :price,            presence: true, format: { with: /\A[300-9999999]\z/, message: 'is out of setting range' }, { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters'}
  validates :image,            presence: true

  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :burden, :area, :scheduled_date
end