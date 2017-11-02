class Schedule < ApplicationRecord
  belongs_to :experience
  has_many :bookings
  validates :date, presence: :true
end
