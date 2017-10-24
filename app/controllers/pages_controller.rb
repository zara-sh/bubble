class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def search
  end

  def profile
    @user = current_user
  end

  def edit # profile
    @user = current_user
  end

  def update # profile
    @user = current_user

    if @user.update(user_params)
      redirect_to profile_path
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @user.delete
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :photo, :bio, :hobbies)
  end
end
