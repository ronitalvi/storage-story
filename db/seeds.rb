# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print '~ destroying...'.red
Code.destroy_all
Booking.destroy_all
Storage.destroy_all
User.destroy_all
puts 'done'.blue

print '~ creating Codes...'.green
# url to codes json
url = 'https://gist.githubusercontent.com/Goles/3196253/raw/9ca4e7e62ea5ad935bb3580dc0a07d9df033b451/CountryCodes.json'
# get the file and parse it
country_codes = JSON.parse(open(url).read)
# go through the elements
country_codes.each do |code|
  # create new code with element info
  new_code = Code.new(code)
  # save new code
  new_code.save
end
puts 'done'.blue

print '~ creating Users/Storages...'.green
# create phone #
phone = ''
10.times do
  phone += Random.rand(10).to_s
end
20.times do
  user = User.new(
    name:   Faker::Movies::StarWars.character,
    photo: 'https://picsum.photos/150',
    phone_number: phone,
    area_code: Faker::PhoneNumber.extension,
    country_code: Faker::PhoneNumber.country_code,
    email:    Faker::Internet.email,
    password: "123456"
  )
  user.save!
  rand(0..5).times do
    storage = Storage.new(
        photo: "https://picsum.photos/400/300",
        sqm: rand(0..200),
        price: rand(100.2...1000.1).round(2),
        address: Faker::Address.full_address,
        description: Faker::Lorem.paragraph,
        name: Faker::Lorem.sentence,
        user_id: user.id,
      )
    storage.save!
  end
end
puts 'done'.blue

print '~ creating Bookings...'.green
# create 20 bookings
20.times do
  # set values for start date/end date
  start_value = rand(2..30)
  end_value = rand(10..100)
  booking = Booking.new(
    user: User.all.to_a.sample,
    storage: Storage.all.to_a.sample,
    start_date: Faker::Date.forward(start_value).to_s,
    end_date: Faker::Date.forward(end_value).to_s,
    approved: rand(0..1) == 1 ? true : false
  )
  booking.save!
end
puts 'done'.blue
