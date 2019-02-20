class MessagesController < ApplicationController
  before_action :set_message, :actions_array

  def index
    puts "I am #{current_user.name}, id #{current_user.id}, email #{current_user.email}".green
    # get all messages
    @messages = Message.all
    # declare arrays
    @my_rents = []
    @my_storages = []
    # fill arrays
    @messages.each do |message|
      stor = message.booking.storage.user_id == current_user.id
      rent = message.booking.user_id == current_user.id
      @my_rents << message if rent
      @my_storages << message if stor
    end
  end

  # def unread_qty
  #   @messages = Message.all
  #   @mesQty=0
  #   @messages.each do |message|
  #   stor = message.booking.storage.user_id == current_user.id
  #   rent = message.booking.user_id == current_user.id
  #   @mesQty += 1 if (message.read == false && (rent || stor))
  #   end
  #   return @mesQty
  # end

  def new
    @booking = Booking.find(params[:booking_id])
    @message = Message.new
  end

  def create
  end

  def destroy
    # raise
    if params[:book_id].nil?
      @message.destroy
    else
      booking = Booking.find(@message.booking_id)
      booking.destroy
    end
    redirect_to '/messages', notice: 'Message has been deleted.'
  end

  def show
    @message.update(read: true)
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
  rescue ActiveRecord::RecordNotFound => e
    redirect_to messages_path, notice: 'Message not found.'
  end

  # def actions_array
  #   @actions_stor = %w[APPROVED]
  #   @actions_rent = %w[REQUEST]
  # end
end
