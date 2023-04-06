FactoryBot.define do
  factory :route do
    source { Faker::Address.city }
    destination { Faker::Address.city }
    name { "#{Faker::Address.city_prefix}-#{Faker::Address.city_suffix}" }
  end
end
