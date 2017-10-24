class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         has_many :experiences
         has_many :categories
         has_many :user_bookings, dependent: :destroy
         has_many :user_categories, dependent: :destroy
end
