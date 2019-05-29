class BookingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]

  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.update(booking_params)
    redirect_to tour_path(@booking.tour)
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    authorize @booking
    @tour = Tour.find(params[:tour_id])
    @booking.tour = @tour

    @tours = Tour.all
    if @booking.save
      redirect_to tours_path
    else
      render template: 'tours/show', alert: 'Invalid information.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy

    redirect_to bookings_path
  end

  private

  def booking_params
    ### left it at name and photo for testing purposes
    ### include all params when ready
    params.require(:booking).permit(:headcount, :date, :email)
  end
end
