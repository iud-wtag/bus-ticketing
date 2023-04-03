require "faker"
FactoryBot.define do
  factory :route do
    route_source { Faker::Address.city }
    route_destination { Faker::Address.city }
    route_name { "#{Faker::Address.city_prefix}-#{Faker::Address.city_suffix}" }
  end
end
