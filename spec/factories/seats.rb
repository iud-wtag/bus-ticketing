FactoryBot.define do
  factory :seat do
    name { [*('A'..'Z')].sample+[*('1'..'4')].sample }
    booked { [true,false].sample }
    association :bus
  end
end
