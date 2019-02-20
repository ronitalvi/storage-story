class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :storage


  has_many :reviews, dependent: :delete_all
  has_many :messages, dependent: :delete_all

  validates :start_date, presence: true
  validates :end_date, presence: true
end
