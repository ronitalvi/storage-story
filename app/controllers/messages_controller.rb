class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @booking = Booking.find(params[:booking_id])

    @message = Message.new
  end

  def create

  end

  def show
    @messages = Message.where(user_id: current_user)
  end

end
