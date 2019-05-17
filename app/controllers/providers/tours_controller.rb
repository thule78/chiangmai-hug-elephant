class ToursController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @tours = Tour.all
  end

  def show
    @tour = Tour.find(params[:id])
    @booking = Booking.new
    authorize @tour
  end

  def new
    @tour = Tour.new
    authorize @tour
  end

  def create
    @tour = Tour.new(tour_params)
    authorize @tour
    @tour.provider = current_user
    if @tour.save
      redirect_to tour_path(@tour)
    else
      render :new
    end
  end

  def edit
    @tour = Tour.find(params[:id])
    authorize @tour
  end

  def update
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.update(tour_params)
    redirect_to tour_path(@tour)
  end

  def destroy
    @tour = Tour.find(params[:id])
    authorize @tour
    @tour.destroy

    redirect_to tuors_path
  end

  private

  def tour_params
    params.require(:tour).permit(:name, :details, :price, :location, :photo, :photo_one, :photo_two, :photo_three, :provider )
  end
end
