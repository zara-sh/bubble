class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings
  has_attachments :photos, maximum: 5

   geocoded_by :location

  AVABILITY = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
end
