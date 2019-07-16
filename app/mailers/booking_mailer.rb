class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirm.subject
  #
  def create_confirmation
    @booking = params[:booking]

    mail(
      to:       @booking.email,
      subject:  "Chiangmai Hug Elephan Booking!"
    )
  end
end
