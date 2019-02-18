class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings, dependent: :delete_all
  has_many :messages, through: :bookings
  has_many :reviews, through: :bookings
  has_many :storages, dependent: :delete_all

  ## took it out name validaton
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

end
