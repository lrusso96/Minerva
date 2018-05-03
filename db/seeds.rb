# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(name:  'Primo',
             surname: 'Registrato',
             email: 'example@email.com',
             birthdate: Time.now.to_date - 20.year,
             password: 'foobar',
             password_confirmation: 'foobar')

99.times do |n|
  name = Faker::Name.first_name
  surname = Faker::Name.last_name
  email = "example-#{n + 1}@email.com"
  password = 'password'
  date = Faker::Date.between(80.years.ago, 18.years.ago)
  User.create!(name:  name,
               surname: surname,
               email: email,
               birthdate: date,
               password:              password,
               password_confirmation: password)
end
