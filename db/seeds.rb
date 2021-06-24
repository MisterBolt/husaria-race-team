# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!(name:  "Example",
             surname:  "User",
             email: "example@example.pl",
             sex: "Male",
             password:              "password",
             password_confirmation: "password",
             admin: true)

100.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@example.pl"
  password = "password"
  User.create!(name:  name,
               surname: name,
               email: email,
               sex: "Male",
               password:              password,
               password_confirmation: password)
end

200.times do |n|
  name = Faker::FunnyName.name
  location = "Warsaw"
  start = Date.today.plus_with_duration(n)
  ends = start.plus_with_duration(1)
  link = "https://www.google.com/"
  user_id = 1
  Event.create!(name: name,
                location: location,
                start: start,
                end: ends,
                link: link,
                user_id: user_id)
end