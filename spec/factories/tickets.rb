FactoryBot.define do
  factory :ticket do
    total_fare { rand(500..1000) }

    association :user
    association :bus
    association :trip
    association :payment
  end
end
