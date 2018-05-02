class User < ApplicationRecord
  # page size for will_paginate
  self.per_page = 1
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def fullname
    name + ' ' + surname
  end
end
