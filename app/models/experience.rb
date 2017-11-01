class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_many :schedules
  validates :title, :description, :location, :incentive, presence: :true
  has_attachments :photos, maximum: 5

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  #AVABILITY = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
end

