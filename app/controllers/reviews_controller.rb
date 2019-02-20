class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :set_booking, only: [:new, :create, :update]
  def index
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    if @review.save
<<<<<<< HEAD
      redirect_to booking_path(@booking) # i couldn't try because there was no booking view yet // not sure if it works
=======
      redirect_to storage_path(@booking.storage) # i couldn't try because there was no booking view yet // not sure if it works
>>>>>>> 10e1ca1f0fe055a76158ab653af8b2670f233ffc
    else
      render :new
    end
  end

  def show
  end

  def update
  end

  def destroy
    @review.destroy
    redirect_to storages_path
  end

  def edit
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:description, :stars, :booking_id)
  end
end
