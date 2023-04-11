FactoryBot.define do
  factory :trip do
    ticket_price { rand(500..1000) }
    total_booked { rand(0..50) }
    trip_datetime { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) }

    bus_id { create(:bus).id }
    route_id { create(:route).id }
  end
end
