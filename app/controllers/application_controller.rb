class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception

  include Pundit

  before_action :authenticate_user! # this was commented out before


  def after_sign_in_path_for(resource_or_scope)
   root_path
  end


  def default_url_options
    { host: ENV["HOST"] || "localhost:3000" }
  end

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  # aka comment if you're having issues with pundit
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end


private

  def set_profile_photo
    if current_user
      if current_user.no_profile_photo?
        current_user.photo_url = current_user.facebook_picture_url || "http://placehold.it/30x30"
      end
    end
  end

  def set_profile
    unless current_user.full_profile?
      redirect_to profile_edit_path
      flash[:alert] = "Please fill out your whole profile before moving on!"
    end
  end


  def skip_pundit? # may cause error if not careful. watch this one.
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end



