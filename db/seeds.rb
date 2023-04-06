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
  bus = Bus.create(
    name: Faker::Vehicle.license_plate,
    type: ['AC','NON_AC'].sample,
    brand: Faker::Vehicle.manufacture,
    capacity: rand(1..50)
  )
  bus_capacity = bus.capacity
  bus_capacity.times do |i|
    Seat.create(
      seat_name: [*('A'..'Z')].sample+[*('1'..'4')].sample,
      seat_booked: [true,false].sample,
      bus: bus
    )
  end  
end

5.times do
  Route.create(
    source: Faker::Address.city,
    destination: Faker::Address.city,
    name: "#{Faker::Address.city_prefix}-#{Faker::Address.city_suffix}"
  )
end
