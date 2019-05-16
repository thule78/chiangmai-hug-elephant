class Tour < ApplicationRecord
  belongs_to :provider, class_name: "User", foreign_key: 'provider'
  has_many :customers, through: :bookings
  has_many :bookings, dependent: :delete_all

  validates :name, presence: true
  validates :details, presence: true
  validates :photo, presence: true
  validates :price, presence: true,
                    numericality: {only_integer: true,
                      greater_than_or_equal_to: 20}
  validates :location, presence: true
end
