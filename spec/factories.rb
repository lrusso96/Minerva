require 'factory_bot'

# This will guess the User class
FactoryBot.define do
  factory :user do
    name "John"
    surname "Doe"
    email 'email@email.com'
    password 'Password'
    password_confirmation 'Password'
    birthdate Time.now.to_date - 20.year
  end

  # This will use the User class (Admin would have been guessed)
  factory :admin, class: User do
    name "Adama"
    surname "Adminis"
    email 'email_admin@email.com'
    password 'Password'
    password_confirmation 'Password'
    birthdate Time.now.to_date - 40.year
    admin 'true'
  end

  factory :paper do
    user
    title "Titolo paper"
    description "descrizione paper"
    after(:build) do |paper|
      paper.article.attach(io: File.open(File.join(Rails.root, 'db/files/FakePaper.pdf')), filename: 'FakePaper.pdf')
    end
  end

  factory :paper_adm, class: Paper do
    association :user, factory: :admin
    title "Titolo paper admin"
    description "descrizione paper admin"
    after(:build) do |paper|
      paper.article.attach(io: File.open(File.join(Rails.root, 'db/files/FakePaper.pdf')), filename: 'FakePaper.pdf')
    end
  end
end
