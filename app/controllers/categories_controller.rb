class CategoriesController < ApplicationController

    before_action :authenticate_user!, except: [:show]
    before_action  :geocode_user

  def show
    @category= Category.find(params[:id])
    @distance = 6
    @experiences = @category.experiences
    authorize @category
    #@experience_in_cat = @category.experiences

    if params[:date]
      @experiences = @category.experiences.joins(:schedules).where(schedules: {date: params[:date]})
    end


    if current_user
      #@experiences = Experience.near([current_user.latitude, current_user.longitude], @distance)
      @all_experiences = @experiences.where.not(latitude: nil, longitude: nil)
      @experiences = @all_experiences.near([current_user.latitude, current_user.longitude], @distance)
      @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
          marker.lat experience.latitude
          marker.lng experience.longitude
        end
    else
      @experiences = @experiences.where.not(latitude: nil, longitude: nil)
      @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
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





