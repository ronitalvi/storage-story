class Storage < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user

  has_many :bookings, dependent: :delete_all
  has_many :reviews, through: :bookings

  validates :sqm, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
