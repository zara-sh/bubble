class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_many :schedules
  has_attachments :photos, maximum: 5

  validates :title, presence: true,length: {maximum: 1000}, on: :create, allow_nil: false
  validates :description, presence: true,length: {maximum: 10000}, on: :create, allow_nil: false
  validates :location, presence: true,length: {maximum: 100}, on: :create, allow_nil: false
  validates :incentive, presence: true,length: {maximum: 100}, on: :create, allow_nil: false

#   validates :title, presence: true,length: {maximum: 25}, on: :create, allow_nil: false
#   validates :description, presence: true,length: {maximum: 255}, on: :create, allow_nil: false
#   validates :location, presence: true,length: {maximum: 100}, on: :create, allow_nil: false
#   validates :incentive, presence: true,length: {maximum: 100}, on: :create, allow_nil: false

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
  #AVABILITY = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
end

