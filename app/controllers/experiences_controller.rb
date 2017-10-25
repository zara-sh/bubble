class ExperiencesController < ApplicationController

  def show_all
    @experiences = Experience.all
  end

  def show
    @experience = Experience.find(params[:id])

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
    # end
  end

  def create
    @experience = Experience.new(experience_params)
    @experience.user = current_user
    if @experience.save
      redirect_to experience_path(@experience)
    else
      render :new
    end
  end

  def edit
    @experience = Experience.find(params[:id])
  end

  def update
    @experience = Experience.find(params[:id])
    if @experience.update(experience_params)
      redirect_to experience_path(@experience)
    else
      render :edit
    end
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.delete
    redirect_to root_path
  end

  private

  def experience_params
    #makes sure photo is last or else it breaks
    params.require(:experience).permit(:category_id, :title, :description, :incentive, :location, :availability, :query, :photos => [])
  end

end
