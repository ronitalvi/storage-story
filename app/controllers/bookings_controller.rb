class BookingsController < ApplicationController
    before_action :index
  def index

    @bookings = Booking.all
    @my_storage_bookings = []
    @bookings.each do |booking|
      if booking.storage.user_id == current_user.id
        @my_storage_bookings << booking
      end
    end

    @my_rents = Booking.where(user: current_user)

  end

  def show
  end

  def new
  end

  def create
  end
end
