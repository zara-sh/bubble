class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authenticate_user!

  def after_sign_in_path_for(resource_or_scope)
   root_path
  end



private

    def set_profile
    unless current_user.full_profile?
      redirect_to profile_edit_path
      flash[:alert] = "Please fill out your whole profile before booking or adding an experience post!"
    end
  end
end



