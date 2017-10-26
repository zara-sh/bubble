class BookingsController < ApplicationController

  def index
    @bookings = current_user.bookings
    @experiences = current_user.experiences
  end

  def show
    @booking = Booking.find(params[:id])
    @guide = @booking.experience.user
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = @experience.bookings.create
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    if @booking.save
      # redirect_to  @booking
      redirect_to  bookings_path
      # (experience_id: @booking.experience_id, id: @booking.id)
    else
      render :new
    end
  end

  private

  def booking_params # TODO: check to see if this works
    params.require(:booking).permit(:experience_id, :customer_id, :date)
  end

end
