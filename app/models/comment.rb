class Comment < ApplicationRecord
  belongs_to :issue
  belongs_to :user

  # Validations
  validates :user, presence: true
  validates :comment, presence: true, length: { maximum: 2000 }
end
