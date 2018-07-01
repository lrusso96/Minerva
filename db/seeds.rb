# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#  movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#  Character.create(name: 'Luke', movie: movies.first)

admin = User.create!(name:  'Primo',
                     surname: 'Registrato',
                     email: 'example@email.com',
                     birthdate: Time.now.to_date - 20.year,
                     password: 'foobar',
                     password_confirmation: 'foobar')
admin.update_attribute :admin, true

9.times do |n|
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

# Papers
users = User.order(:created_at).take(3)
colors = ['31, 164, 99', '255, 208, 75', '218, 72, 59', '70, 136, 244']
2.times do
  users.each do |user|
    title = Faker::Lorem.sentence(5, false, 10)
    description = Faker::Lorem.sentences.join(' ')
    color = "rgb(#{colors.sample})"
    user.papers.create!(description: description, title: title, color: color)
    user.papers.last.article.attach(io: File.open(File.join(Rails.root, 'db/files/FakePaper.pdf')), filename: 'FakePaper.pdf')
  end
end

fu = users.first
lu = users.last

fu.follow!(lu)
fu.like!(lu.papers.first)
