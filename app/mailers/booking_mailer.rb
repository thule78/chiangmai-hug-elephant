class BookingMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.booking_mailer.confirm.subject
  #
  def confirm
    @greeting = "Dear Customer"

    mail (to: @booking.email, subject: "Chiangmai Hug Elephant Booking")
  end
end
