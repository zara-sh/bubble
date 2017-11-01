class Schedule < ApplicationRecord
  belongs_to :experience
  validates :date, presence: :true
  has_many :events, dependent: :destroy
end
