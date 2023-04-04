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
    bus_name: Faker::Vehicle.license_plate,
    bus_type: ["AC","Non-AC"].sample,
    bus_brand: Faker::Vehicle.manufacture,
    bus_capacity: rand(1..50)
  )
  bus_capacity = bus.bus_capacity
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
    route_source: Faker::Address.city,
    route_destination: Faker::Address.city,
    route_name: "#{Faker::Address.city_prefix}-#{Faker::Address.city_suffix}"
  )
end

5.times do
  Trip.create(
    bus: Bus.all.sample,
    route: Route.all.sample,
    ticket_price: rand(500..1000),
    total_booked: rand(0..50),
    trip_datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) 
  )
end  