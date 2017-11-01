class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]


  has_many :experiences, dependent: :destroy
  has_many :bookings, dependent: :destroy
  # has_many :user_categories, dependent: :destroy
  has_and_belongs_to_many :categories
  has_attachment :photo
  # has_many :experience_categories, through: :experiences, source: :categories
  # geocoded_by :current_sign_in_ip
  geocoded_by :ip_address
  after_validation :geocode
    def self.find_for_facebook_oauth(auth)
    user_params = auth.slice(:provider, :uid)
    user_params.merge! auth.info.slice(:email, :first_name, :last_name)
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

   def ip_address
     self.current_sign_in_ip.to_s
   end

   def full_profile?
    !self.name.nil? &&
    !self.bio.nil? &&
    !self.hobbies.nil? &&
    !self.phone.nil?
    # !self.photo.nil?
   end

   def no_profile_photo?
    self.photo.nil?
   end

  # below in case we need to skip confirmation
  # protected

  # def confirmation_required?
  #   false
  # end
end
