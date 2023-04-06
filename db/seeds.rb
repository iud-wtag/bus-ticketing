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
    name: Faker::Vehicle.license_plate,
    type: ['AC','NON_AC'].sample,
    brand: Faker::Vehicle.manufacture,
    capacity: rand(1..50)
  )
end
