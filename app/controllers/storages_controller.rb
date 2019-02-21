class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  def index
    @storages = Storage.all
    @reviews = {}
    @storages.each do |el|
     @reviews[el.id] = 0
     sum = 0
     i = 0
     el.reviews.each do |rev|
       sum += rev.stars
       i += 1
     end
     @reviews[el.id] = sum / i unless i.zero?
   end

    @markers = @storages.map do |storage|
      {
        lng: storage.longitude,
        lat: storage.latitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { storage: storage })
      }
    end
  end

  def show
  end

  def new
    @storage = Storage.new
  end

  def edit
  end

  def create
    @storage = Storage.new(storage_params)
    @storage.user = current_user
    if @storage.save
      redirect_to profile_path, notice: 'storage was successfully updated.'
    else
      render :new
    end
  end

  def update
    if @storage.update(storage_params)
      redirect_to @storage, notice: 'storage updated.'
    else
      render :edit
    end
  end

  def destroy
    @storage.destroy
    redirect_to storages_path, notice: '    destroyed.'
  end

  private

  def set_storage
    @storage = Storage.find(params[:id])
  end

  def storage_params
    params.require(:storage).permit(:address, :photo, :sqm, :price, :description, :name)
  end
end
