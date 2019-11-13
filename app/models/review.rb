class Review < ApplicationRecord
  belongs_to :restaurant

  validates :restaurant, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, presence: true, inclusion: { in: (0..5) }
  validates :content, presence: true, allow_blank: false
end
