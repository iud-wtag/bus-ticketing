require "faker"
FactoryBot.define do
  factory :trip do
    ticket_price { rand(500..1000) }
    total_booked { rand(0..50) }
    trip_datetime { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }

    association :bus
    association :route
  end
end
