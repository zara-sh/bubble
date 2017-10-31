class Schedule < ApplicationRecord
  belongs_to :experience
  validates :date, presence: :true
end
