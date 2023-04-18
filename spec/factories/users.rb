FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    phone { "+8801874123695" }
    user_name { Faker::Internet.username }
    role { :user }
  end
end
