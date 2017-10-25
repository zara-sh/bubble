class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @categorie_latte = Category.where(name: 'The best latte around').first
    @categorie_happy = Category.where(name: 'Happy hours').first
    @categorie_workout = Category.where(name: 'the best workouts around').first
    @categorie_relax = Category.where(name: 'stress relief relaxation').first
    @categorie_tourism = Category.where(name: 'Tourism spot in  the town').first
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
      redirect_to user_edit_path
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
