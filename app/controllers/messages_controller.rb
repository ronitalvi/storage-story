class MessagesController < ApplicationController
  before_action :set_message
  def index
    puts 'Messages Controller says "hi!"'.red
    @messages = Message.all
    @my_rents = []
    @my_storages = []
    @messages.each do |message|
      @my_rents << message if message.booking.user_id == current_user.id
      stor_owner = message.booking.storage.user_id
      if stor_owner == current_user.id
        @my_storages << message unless message.description.split(': ')[0]=='APPROVED'
      end
    end
  end

  def new
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
  end

  def create
  end

  def destroy
    @message.destroy
    redirect_to '/messages', notice: 'Message has been deleted.'
  end

  def approved
    Message.find(params[:id]).booking.approved = true
    message = Message.new(
      booking_id: Message.find(params[:id]).booking.id,
      user_id: Message.find(params[:id]).booking.user_id,
      description: "APPROVED: #{Message.find(params[:id]).booking.storage.name}"
    )
    message.save!
    redirect_to messages_path, notice: 'Booking has been approved.'
  end

  private

  def set_message
    @message = Message.find(params[:id]) unless params[:id].nil?

  end

end
