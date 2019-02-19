class Review < ApplicationRecord
  belongs_to :booking

  validates :stars, inclusion: 0..5
end

