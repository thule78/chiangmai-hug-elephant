class Booking < ApplicationRecord
  belongs_to :tour
  validates :headcount, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 15}
  validates :date, presence: true
  validates :email, presence: true, :format => /\A(\S+)@(.+)\.(\S+)\z/

  def self.has_unconfirmed_requests?(user)
    unconfirmed_bookings = 0
    user.tours.each do |tour|
      tour.bookings.select do |booking|
        if booking.confirmed.nil?
          unconfirmed_bookings += 1
        end
      end
    end
    unconfirmed_bookings.positive?
  end
end
