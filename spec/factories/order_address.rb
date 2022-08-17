FactoryBot.define do
  factory :order_address do
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
    post_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    area_id { Faker::Number.between(from: 2, to: 48) }
    municipality { Faker::Address.city }
    house_num { Faker::Address.street_address }
    phone_num { Faker::Number.decimal_part(digits: 11) }
    user_id { Faker::Number.non_zero_digit }
    item_id { Faker::Number.non_zero_digit }
  end
end
