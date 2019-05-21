class Tour < ApplicationRecord
  belongs_to :provider, class_name: "User", foreign_key: 'provider_id'
  has_many :customers, through: :bookings
  has_many :bookings, dependent: :delete_all

  mount_uploader :photo, PhotoUploader
  mount_uploader :photo_one, PhotoUploader
  mount_uploader :photo_two, PhotoUploader
  mount_uploader :photo_three, PhotoUploader

  validates :name, presence: true
  validates :details, presence: true
  validates :photo, presence: true
  validates :price, presence: true,
                    numericality: { only_integer: true,
                      greater_than_or_equal_to: 20 }
  validates :location, presence: true

  include PgSearch
  pg_search_scope :search_for_tour,
    against: [ :name, :location, :details ],
    using: {
      tsearch: { prefix: true }
    }

  def unconfirmed_count
    count = 0
    self.bookings.each do |booking|
      if booking.confirmed.nil?
        count += 1
      end
    end
    count
  end
end
