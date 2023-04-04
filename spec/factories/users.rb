require "faker"
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    user_name { Faker::Internet.username }
    role { :user }
  end
end
