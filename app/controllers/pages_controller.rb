class PagesController < ApplicationController
  before_action :authenticate_user!, except: [:home]
  before_action :set_profile_photo, only: [:home, :profile]

  def home
    @categories = Category.all
    # @categorie_latte = Category.where(name: 'The best latte around').first
    # @categorie_happy = Category.where(name: 'Happy hours').first
    # @categorie_workout = Category.where(name: 'the best workouts around').first
    # @categorie_relax = Category.where(name: 'stress relief relaxation').first
    # @categorie_tourism = Category.where(name: 'Tourism spot in  the town').first
  end

  def search
  end

  respond_to :json
  def profile
    # @events = Event.where(user_id: current_user.id)
    @events = Event.all
    render :text => @events.to_json
  end


  def edit # profile
    # unless current_user.full_profile?
    #   profile_edit_path
    #   flash[:alert] = "Please fill out your whole profile before moving on! (did you forget photo?)"
    # end
    @user = current_user
  end

  def update # profile
    # unless current_user.full_profile?
    #   profile_edit_path
    #   flash[:alert] = "Please fill out your whole profile before moving on! (did you forget photo?)"
    # end

    @user = current_user

    if @user.update(user_params)
      redirect_to bookings_path
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
    params.require(:user).permit(:name, :email, :phone, :bio, :hobbies, :photo)
  end
end
