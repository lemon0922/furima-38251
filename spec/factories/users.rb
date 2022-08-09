FactoryBot.define do
  factory :user do
    nickname {"lemon"}
    email {Faker::Internet.free_email}
    password {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    family_name {"田中"}
    first_name {"太郎"}
    read_family {"タナカ"}
    read_first {"タロウ"}
    birth {"2000/01/01"}
  end
end