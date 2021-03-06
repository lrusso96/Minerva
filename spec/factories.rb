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

  factory :issue do
    title 'titolo issue'
    description 'descrizione issue'
    paper
    opener_id '1' # can't use factory user because it's already called in :paper
  end

  factory :issue_adm, class: Issue do
    title 'titolo issue'
    description 'descrizione issue'
    association :paper, factory: :paper_adm
    opener_id '1' # can't use :admin because it's already called in :paper_adm
  end

  factory :comment do
    comment 'commento'
    association :issue, factory: :issue_adm
    user
  end
end
