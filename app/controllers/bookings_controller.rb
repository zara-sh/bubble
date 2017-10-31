class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show]

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
      redirect_to  booking_path(@booking)
      # (experience_id: @booking.experience_id, id: @booking.id)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.delete
    redirect_to bookings_path
  end

  def test(booking)
    if booking.confirmed == true
      return "Confirmed!"
    else
      return "Awaiting confirmation..."
    end
  end

  def conf(booking)
    booking.confirmed = true
  end

  def rej(booking)
    # send email with pertinent information
    booking.delete
    redirect_to bookings_path
  end

  helper_method :test
  helper_method :conf
  helper_method :rej

  private

  def booking_params # TODO: check to see if this works
    params.require(:booking).permit(:experience_id, :customer_id, :date)
  end

end
