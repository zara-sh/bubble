class ExperiencesController < ApplicationController

def show
    @experience = Experience.find(params[:id])
  end

  def new
    if (current_user.name.nil? ||
      current_user.address.nil? ||
      current_user.phone.nil? ||
      current_user.photo.nil?)
      $error_message = "Must have profile completely set up before making a experience post or reservation"
      redirect_to root_path
      else
      $error_message = ""
      @experience = Experience.new
    end
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
    @experience.update(experience_params)
    redirect_to experience_path(@experience)
  end

  def destroy
    @experience = Experience.find(params[:id])
    @experience.destroy
    redirect_to experiences_path
  end

  private

  def experience_params # TODO: check to see if this works
    params.require(:experience).permit(:title, :description, :incentive, :location, :availability)
  end

end