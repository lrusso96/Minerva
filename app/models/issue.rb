class Issue < ApplicationRecord
  belongs_to :paper
  belongs_to :opener, class_name: 'User'
  has_many :comments, dependent: :destroy

  # Validations
  validates :opener, presence: true
  validates :title, presence: true, length: { maximum: 200 }
  validates :description, presence: true, length: { maximum: 2000 }
  validates :paper, presence: true
end
