class Providers::BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking).order(created_at: :desc)
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.confirmed = true
    @booking.save

    redirect_to providers_bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to providers_bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmed)
  end
end
