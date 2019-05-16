class Booking < ApplicationRecord
  belongs_to :tour
  belongs_to :customer, class_name: "User", foreign_key: 'customer_id'
  validates :headcount, presence: true, numericality: {only_integer: true, greater_than: 0, less_than_or_equal_to: 15}
  validates :date, presence: true
end
