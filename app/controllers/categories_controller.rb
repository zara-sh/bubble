class CategoriesController < ApplicationController
     before_action :authenticate_user!, except: [:show]


  def show
    @category= Category.find(params[:id])

    if  current_user
      current_user.save
        @day_experiences = @category.experiences.where("availability ILIKE ?", "%#{params[:search]}%")
        @experiences = @day_experiences.where.not(latitude: nil, longitude: nil)
        location = @experiences.near([current_user.latitude, current_user.longitude], 10)
        @hash = Gmaps4rails.build_markers(location) do |experience, marker|
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
