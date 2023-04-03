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
