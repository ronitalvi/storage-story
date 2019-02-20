class Review < ApplicationRecord
  belongs_to :booking
<<<<<<< HEAD
  validates :description, presence: true
  validates :stars, inclusion: { in: %w[0 1 2 3 4 5] }
=======

  validates :stars, inclusion: 0..5
>>>>>>> 644133b4bb7e4355949db6718b46d52455de6419
end
