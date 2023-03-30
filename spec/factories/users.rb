FactoryBot.define do
  factory :user do
    name { "John Doe1" }
    email { "john.doe@example.com" }
    password { "password123" }
    phone { "12345678901" }
    user_name { "johndoe" }
    role { :user }
  end
end
