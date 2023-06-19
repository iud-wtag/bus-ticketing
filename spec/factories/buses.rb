FactoryBot.define do
  factory :bus do
    name { Faker::Vehicle.license_plate }
    typed { ['AC','NON_AC'].sample }
    brand { Faker::Vehicle.manufacture }
    capacity { rand(1..50) }
  end
end
