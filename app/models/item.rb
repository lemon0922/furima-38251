class Item < ApplicationRecord
  validates :title,            presence: true
  validates :content,          presence: true
  validates :category_id,      numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id,     numericality: { other_than: 1, message: "can't be blank" }
  validates :burden_id,        numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id,          numericality: { other_than: 1, message: "can't be blank" }
  validates :scheduled_date_id,numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equel_to: 300, less_than_or_equel_to: 9_999_999 },
                      presence: { message: "can't be blank" }
  end
  validates :image,            presence: true

  belongs_to       :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :burden, :area, :scheduled_date
end