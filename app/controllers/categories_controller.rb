class CategoriesController < ApplicationController

    before_action :authenticate_user!, except: [:show]
    before_action  :geocode_user

  def show
    @category= Category.find(params[:id])
    @distance = 100
    @experiences = @category.experiences
    #@experience_in_cat = @category.experiences

    if params[:date]
      @experiences = @category.experiences.joins(:schedules).where(schedules: {date: params[:date]})
    end


    if current_user
      #@experiences = Experience.near([current_user.latitude, current_user.longitude], @distance)
      @all_experiences = @experiences.where.not(latitude: nil, longitude: nil)
      @experiences_in_map = @all_experiences.near([current_user.latitude, current_user.longitude], @distance)
      @hash = Gmaps4rails.build_markers(@experiences_in_map) do |experience, marker|
          marker.lat experience.latitude
          marker.lng experience.longitude
        end
    else
      @all_experiences = @experiences.where.not(latitude: nil, longitude: nil)
      @hash = Gmaps4rails.build_markers(@all_experiences) do |experience, marker|
        marker.lat experience.latitude
        marker.lng experience.longitude
      end
    end
  end

    private
    def geocode_user
      if current_user
        current_user.geocode
      end
    end
end





