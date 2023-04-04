FactoryBot.define do
  factory :seat do
    seat_name { [*('A'..'Z')].sample+[*('1'..'4')].sample }
    seat_booked { [true,false].sample }
    association :bus
  end
end
