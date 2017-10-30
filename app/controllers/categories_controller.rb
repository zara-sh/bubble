class CategoriesController < ApplicationController
     before_action :authenticate_user!, except: [:show]
    before_action  :geocode_user

  def show
    @category= Category.find(params[:id])
    @distance = 30
    @experiences = @category.experiences

    if params[:date]
      @experiences = []
      @category.experiences.each do |experience|
        unless experience.schedules.where(date: params[:date]).empty?
          @experiences << experience.schedules.where(date: params[:date]).first.experience
        end
      end
    end

    #@date = params[:date]
    #  if  current_user
    # #     @day_experiences = @category.experiences.where("date ILIKE ?", "%#{params[:search]}%")
    #      @all_experiences = @experiences.where.not(latitude: nil, longitude: nil)
    #     @experiences = @all_experiences.near([current_user.latitude, current_user.longitude], @distance)
    #     @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
    #       marker.lat experience.latitude
    #       marker.lng experience.longitude
    #     end
    #  else
    #     #@day_experiences = @category.experiences.where("availexperience.schedules.where(date: params[:date])ability ILIKE ?", "%#{params[:search]}%")
    #     @experiences_ava = @experiences.where.not(latitude: nil, longitude: nil)
    #     @hash = Gmaps4rails.build_markers(@experiences_ava) do |experience, marker|
    #       marker.lat experience.latitude
    #       marker.lng experience.longitude
    #      end
    # end
      # marker.infowindow render_to_string(partial: "/experiences/map_box", locals: { experience: experience })
    end


    private
    def geocode_user
      if current_user
        current_user.geocode
      end
    end
end
