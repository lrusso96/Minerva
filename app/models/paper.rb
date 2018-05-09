class Paper < ApplicationRecord
  belongs_to :user
  mount_uploader :article

  # Validations
  validates :user, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 2000 }
  # commented for seed!!! validates :article, presence: true
end
