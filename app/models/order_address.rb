class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipality, :house_num, :building_name, :phone_num, :user_id, :item_id, :token

  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :house_num
    validates :phone_num, format: {with: /\A[0-9]{11}\z/, message: 'is invalid' }
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, area_id: area_id, municipality: municipality, house_num: house_num, building_name: building_name, phone_num: phone_num, order_id: order.id)
  end
end
