class Review < ApplicationRecord
  belongs_to :booking
  validates :description, presence: true
  validates :stars, inclusion: { in: %w[0 1 2 3 4 5] }
end
