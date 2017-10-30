class CategoriesController < ApplicationController
     before_action :authenticate_user!, except: [:show]
    before_action  :geocode_user

  def show
    @category= Category.find(params[:id])
    @distance = 300000
    @experiences = @category.experiences

    if params[:date]
      @experiences = []
      @experiences_base_user.each do |experience|
        unless experience.schedules.where(date: params[:date]).empty?
          @experiences << experience.schedules.where(date: params[:date]).first.experience
        end
      end
    end


    #@date = params[:date]
    if current_user
      # @experiences = @experiences.select {|item| item.latitude != nil}
      @experiences = Experience.near([current_user.latitude, current_user.longitude], @distance)
byebug
      @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
          marker.lat experience.latitude
          marker.lng experience.longitude
        end
    else
      @experiences = @experiences.select {|item| item.latitude != nil}
      @hash = Gmaps4rails.build_markers(@experiences) do |experience, marker|
        marker.lat experience.latitude
        marker.lng experience.longitude
      end
    end
      # marker.infowindow render_to_string(partial: "/experiences/map_box", locals: { experience: experience })
  end

    private
    def geocode_user
      if current_user
        current_user.geocode
      end
    end
end
