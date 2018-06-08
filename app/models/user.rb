class User < ApplicationRecord
  has_many :papers, dependent: :destroy

  # page size for will_paginate (test with 1 for now)
  self.per_page = 30
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  #
  # Note: devise :validatable above adds validations for :email and :password
  validates :name, presence: true, length: { maximum: 60 }
  validates :surname, presence: true, length: { maximum: 60 }
  validates :birthdate, presence: true,
                        date: { before: proc { Time.now - 18.year } }
  validates :nickname, length: { maximum: 60 }
  validates :country, length: { maximum: 2 }
  validates :website, length: { maximum: 60 }
  # Methods

  # fullname
  def fullname
    name + ' ' + surname
  end

  def formatted_nickname
    "@#{nickname}" unless nickname.to_s.blank?
  end

  def country_name
    c = ISO3166::Country[country]
    c.translations[I18n.locale.to_s] || country.name
  end
end
