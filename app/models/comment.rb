class Comment < ApplicationRecord
  belongs_to :post

  # Validations
  validates :user, presence: true
  validates :comment, presence: true, length: { maximum: 2000 }
end
