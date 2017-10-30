class Category < ApplicationRecord
  has_many :experiences
  has_and_belongs_to_many :users, join_table: :user_categories
end
