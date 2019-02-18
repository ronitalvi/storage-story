class BookingsController < ApplicationController

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
    @booking = Booking.new
    @storage = Storage.find(params['storage_id'])
  end

  def create
    booking = Booking.new(
      storage_id: params[:storage_id],
      start_date: params[:booking][:start_date],
      end_date: params[:booking][:end_date],
      approved: false,
      user_id: current_user.id
    )
    booking.save!
    if booking.save!
      redirect_to Storage.find(params[:storage_id]), notice: 'storage was successfully booked.'
    else
      render :new
    end
  end
end
