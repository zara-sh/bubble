class Experience < ApplicationRecord
  belongs_to :user
  belongs_to :category

  AVABILITY = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
end
