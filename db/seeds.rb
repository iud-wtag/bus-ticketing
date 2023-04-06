require "faker"

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    user_name: Faker::Internet.username,
    role: [:user, :admin].sample
  )
end  

5.times do
  Bus.create(
    bus_name: Faker::Vehicle.license_plate,
    bus_type: ['AC','NON_AC'].sample,
    bus_brand: Faker::Vehicle.manufacture,
    bus_capacity: rand(1..50)
  )
end

5.times do
  Route.create(
    route_source: Faker::Address.city,
    route_destination: Faker::Address.city,
    route_name: "#{Faker::Address.city_prefix}-#{Faker::Address.city_suffix}"
  )
end
