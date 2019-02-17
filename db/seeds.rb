# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

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

puts 'Destroying all storage'
Storage.destroy_all
puts 'the storage are destroyed bro'
puts 'Destroying all users'
User.destroy_all
puts 'the User are destroyed bro'

puts 'Creating 10 fake users...'
10.times do
  user = User.new(
    email:    Faker::Internet.email,
    name:   Faker::Movies::StarWars.character,
    country_code:  rand(1..50),
    password: "123456"
  )
  user.save!
  rand(1..5).times do
    storage = Storage.new(
        user_id: user.id,
        name: Faker::Name.first_name,
        sqm: rand(0..200),
        description: Faker::Movies::StarWars.quote,
        address: Faker::Address.secondary_address,
        price: rand(100.2...8000.1),
        photo: "https://picsum.photos/200/300"
      )
    storage.save!
  end
end
puts 'Finished!'

