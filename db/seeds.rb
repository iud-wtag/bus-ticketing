
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

5.times do
  Trip.create(
    bus: Bus.all.sample,
    route: Route.all.sample,
    ticket_price: rand(500..1000),
    total_booked: rand(0..50),
    trip_datetime: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :default) 
  )
end  

2.times do
  user = User.all.sample
  trip = Trip.all.sample
  payment = Payment.create()
  seats_count = rand(1..5)
  seats = Seat.where(bus_id: trip.bus_id, seat_booked: false).sample(seats_count)
  seats.each do |seat|
    seat.update(seat_booked: true)
    Ticket.create(user: user,bus: trip.bus, trip: trip, payment: payment, seats: [seat], total_fare: trip.ticket_price)
  end  
end
