class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :storage


  has_many :reviews
  has_many :mesages

  validates :star_date, presence: true
  validates :end_date, presence: true
end
