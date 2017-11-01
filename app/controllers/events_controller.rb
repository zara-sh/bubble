class EventsController < ApplicationController
  before_action :authenticate_user!

  def the_calender
    @events = Event.where(user_id: current_user.id)
  end

end
