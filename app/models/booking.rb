class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :customer, class_name: "User", foreign_key: 'customer_id'
  validates :headcount, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 15}
  validates :date, presence: true
  validates :pick_up, presence: true

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
