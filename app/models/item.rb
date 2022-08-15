class Item < ApplicationRecord
  validates :title,                  presence: true
  validates :content,                presence: true
  validates :category_id,            numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,           numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id,              numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,                numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_date_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :price,
            { format: { with: /\A[0-9]+\z/ },
              numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } }
  validates :image, presence: true

  belongs_to       :user
  has_one          :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :burden
  belongs_to_active_hash :area
  belongs_to_active_hash :scheduled_date
end
