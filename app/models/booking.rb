class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  belongs_to :schedule
  has_many :events, dependent: :destroy
end
