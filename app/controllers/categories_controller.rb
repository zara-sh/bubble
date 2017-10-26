class CategoriesController < ApplicationController
   before_action :authenticate_user!


  def show
    @category= Category.find(params[:id])
    @experiences = @category.experiences.where("availability ILIKE ?", "%#{params[:search]}%")
  end
end
