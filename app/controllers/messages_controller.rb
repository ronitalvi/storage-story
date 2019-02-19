class MessagesController < ApplicationController
  def index
    puts 'Messages Controller says "hi!"'.red
    @messages = Message.all
    @my_rents = []
    @my_storages = []
    @messages.each do |message|
      if message.booking.user_id == current_user.id
        @my_rents << message
      end
      stor_owner = message.booking.storage.user_id
      if stor_owner == current_user.id
        @my_storages << message
      end
    end
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
  end

  def create
  end

  def show
    @message = Message.find(params[:id])
  end
end
