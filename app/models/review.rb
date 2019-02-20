class Review < ApplicationRecord
  belongs_to :booking
  validates :description, presence: true
  validates :stars, inclusion: 0..5
end
