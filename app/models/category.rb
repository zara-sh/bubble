class Category < ApplicationRecord
  has_many :experiences
  has_many :user_categories
end
