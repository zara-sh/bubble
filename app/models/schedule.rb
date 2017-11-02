class Schedule < ApplicationRecord
  belongs_to :experience
  has_many :bookings, dependent: :destroy
  validates :date, presence: :true
end
