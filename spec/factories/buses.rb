require "faker"
FactoryBot.define do
  factory :bus do
    bus_name {Faker::Vehicle.license_plate}
    bus_type {["AC","Non-AC"].sample}
    bus_brand {Faker::Vehicle.manufacture}
    bus_capacity {rand(1..50)}
  end
end
