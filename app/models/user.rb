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

  # Methods

  # fullname
  def fullname
    name + ' ' + surname
  end
end
