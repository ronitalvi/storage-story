class BookingsController < ApplicationController
    before_action :set_booking
  def index
@bookings = Booking.all
    # declare arrays
    @my_rents = []
    @my_storages = []
    # fill arrays
    @bookings.each do |booking|
      # byebug
      stor = booking.storage.user_id == current_user.id
      rent = booking.user_id == current_user.id
      # action = message.description.split(': ')[0]
      @my_rents << booking if rent
      @my_storages << booking if stor
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def destroy
    @booking.destroy
    puts "#{@booking.id} has been deleted".red
    redirect_to '/bookings/', notice: 'Booking has been canceled.'
  end

  def new
    @booking = Booking.new
    @storage = Storage.find(params['storage_id'])
  end

  def approved
    booking = Booking.find(params[:id])
    booking.update(approved: true)
    puts "Booking #{booking.id}: approved".green
    new_message = Message.new(
      booking_id: booking.id,
      user_id: booking.user_id,
      description: "APPROVED: #{booking.storage.name}"
    )
    new_message.save
    puts "Approval message #{new_message.id}: created".green
    message = Message.find(request.referrer.match(/(\d*$)/)[0])
    message.destroy
    puts "Request message #{message.id}: destroyed".red
    puts "Going back to #{messages_path}".blue
    redirect_to messages_path
  end

  def create
    booking = Booking.new(
      storage_id: params[:storage_id],
      start_date: params[:booking][:start_date],
      end_date: params[:booking][:end_date],
      approved: false,
      user_id: current_user.id
    )

    if booking.save!
      notification = Message.new(description: "REQUEST: #{booking.storage.name}", user_id: booking.user_id, booking_id: booking.id)
      notification.save
      redirect_to Storage.find(params[:storage_id]), notice: 'storage was successfully booked.'
    else
      render :new
    end
  end
    private

  def set_booking
    @booking = Booking.find(params[:id]) unless params[:id].nil?
  end
end
