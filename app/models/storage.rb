class Storage < ApplicationRecord
  belongs_to :user

  has_many :bookings

  has_many :reviews, through: :bookings

  validates :sqm, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
