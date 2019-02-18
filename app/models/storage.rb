class Storage < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :delete_all

  validates :sqm, presence: true
  validates :price, presence: true
  validates :address, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :photo, presence: true
end
