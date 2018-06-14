class Paper < ApplicationRecord
  belongs_to :user
  has_one_attached :article

  # Validations
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :article, presence: true
end
