class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:new, :create]

  # authorize @experience


  def show_all
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])
    authorize @experience
  end


  def new
    # if (current_user.name.nil? ||
    #   current_user.address.nil? ||
    #   current_user.phone.nil? ||
    #   current_user.photo.nil?)
    #   $error_message = "Must have profile completely set up before making a experience post or reservation"
    #   redirect_to root_path
    #   else
    #   $error_message = ""
      @experience = Experience.new
      authorize @experience
    # end
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    authorize @experience
    if @experience.save
      if @experience.photos.first.nil?
        @experience.photo_urls = ['https://gaijinpot.scdn3.secure.raxcdn.com/wp-content/uploads/sites/6/2016/05/Meguro-streets.jpg']
      end

      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
    # authorize @experience
  end

  def update
    @experience = Experience.find(params[:id])
    authorize @experience
    if @experience.update(experience_params)
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    authorize @experience
    @experience.delete
    redirect_to root_path
  end

  private

  def experience_params
    #makes sure photo is last or else it breaks
    params.require(:experience).permit(:category_id, :title, :description, :incentive, :location, :availability, :query, :photos => [])
  end

  # def set_experience_photo
  #   unless @experience.experience_photo?
  #     @experience.photo_urls = ["http://placehold.it/100x100", "http://placehold.it/100x100"]
  #   end
  # end

end
