class CategoriesController < ApplicationController
  def show
       @experiences = Experience.where(category_id: params[:id])
  end
end
