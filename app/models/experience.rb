class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings

  AVABILITY = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
end
