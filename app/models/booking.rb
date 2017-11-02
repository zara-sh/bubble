class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :experience
  belongs_to :schedule
end
