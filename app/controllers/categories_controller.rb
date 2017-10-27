class CategoriesController < ApplicationController
     before_action :authenticate_user!, except: [:show]


  def show
    @category= Category.find(params[:id])
    @distance = 50
    if  current_user
        current_user.geocode
        @day_experiences = @category.experiences.where("availability ILIKE ?", "%#{params[:search]}%")
        @all_experiences = @day_experiences.where.not(latitude: nil, longitude: nil)
        @experiences = @all_experiences.near([current_user.latitude, current_user.longitude], @distance)
        @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
          marker.lat experience.latitude
          marker.lng experience.longitude
        end
    else
        @day_experiences = @category.experiences.where("availability ILIKE ?", "%#{params[:search]}%")
        @experiences = @day_experiences.where.not(latitude: nil, longitude: nil)
        @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
          marker.lat experience.latitude
          marker.lng experience.longitude
        end
    end




      # marker.infowindow render_to_string(partial: "/experiences/map_box", locals: { experience: experience })
    end
end
