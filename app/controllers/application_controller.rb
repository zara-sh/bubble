class ApplicationController < ActionController::Base


  protect_from_forgery with: :exception

  # before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
   root_path
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
end



