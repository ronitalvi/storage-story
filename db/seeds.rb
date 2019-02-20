# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print '~ destroying...'.red
Code.destroy_all
# Message.destroy_all
# Review.destroy_all
Booking.destroy_all
Storage.destroy_all
User.destroy_all
puts 'done'.blue

print '~ creating Codes'.green
# url to codes json
url = 'https://gist.githubusercontent.com/Goles/3196253/raw/9ca4e7e62ea5ad935bb3580dc0a07d9df033b451/CountryCodes.json'
# get the file and parse it
country_codes = JSON.parse(open(url).read)
# go through the elements
country_codes.each do |code|
  # create new code with element info
  print '.'.green
  new_code = Code.new(code)
  # save new code
  new_code.save
end
puts 'done'.blue

print '~ creating Users/Storages'.green
# create phone #
phone = ''
10.times do
  phone += Random.rand(10).to_s
end
20.times do
print '.'.green
  user = User.new(
    name:   Faker::Name.name,
    photo: 'https://picsum.photos/150/?random',
    phone_number: phone,
    area_code: Faker::PhoneNumber.extension,
    country_code: Faker::PhoneNumber.country_code,
    email:    Faker::Internet.email,
    password: "123456"
  )
  user.save!
  rand(0..5).times do
    storage = Storage.new(
        photo: "https://picsum.photos/400/?random",
        sqm: rand(0..200),
        price: rand(100.2...1000.1).round(2),
        address: Faker::Address.full_address,
        description: Faker::Lorem.paragraph,
        name: Faker::Lorem.sentence,
        latitude: Faker::Address.latitude,
        longitude: Faker::Address.longitude,
        user_id: user.id
      )
    storage.save!
  end
end
puts 'done'.blue

print '~ creating Bookings/Messages'.green
# create 20 bookings
100.times do
  print '.'.green
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
  message = Message.new(
    booking: booking,
    user: User.all.to_a.sample,
    read: false,
    description: "REQUEST: #{booking.storage.name}"
  )
  message.save!
end
puts 'done'.blue

print '~ creating Reviews'.green
Booking.all.each do |booking|
  print '.'.green
  run = rand(0..10)
  run.times do |tick|
    # byebug
    review = Review.new(
      booking: booking,
      description: Faker::Lorem.sentence,
      stars: rand(0..5)
    )
    review.save!
  end
end
puts 'done'.blue
puts 'Seeding finished.'.blue
