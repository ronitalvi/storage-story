class BookingsController < ApplicationController
    before_action :show
  def index
  end

  def show
    @bookings = Booking.all
  end

  def new

  end
  
  def create

  end
end
