class CategoriesController < ApplicationController
  def show
    @category= Category.find(params[:id])
    @day_experiences = @category.experiences.where("availability ILIKE ?", "%#{params[:search]}%")

    @experiences = @day_experiences.where.not(latitude: nil, longitude: nil)

    @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
      marker.lat experience.latitude
      marker.lng experience.longitude
      # marker.infowindow render_to_string(partial: "/experiences/map_box", locals: { experience: experience })
    end
  end
end
