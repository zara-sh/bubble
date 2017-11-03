class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show]

  def index
    policy_scope(Booking)
    @bookings = current_user.bookings
    authorize @bookings
    @experiences = current_user.experiences
  end

  def show
    @booking = Booking.find(params[:id])
    @guide = @booking.experience.user
  end

  def new
    @experience = Experience.find(params[:experience_id])
    @booking = @experience.bookings.create
    @experience_schedules = []
    @experience.schedules.each do |schedule|
      @experience_schedules << schedule.date
    end
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @schedule = @booking.experience.schedules.where(date: booking_params[:date]).first
    @booking.schedule = @schedule
    authorize @booking
    if @booking.save
         Event.create(title: @booking.experience.title, start: @schedule.date, url: booking_path(@booking), user_id: current_user.id, booking_id: @booking.id)
         Event.create(title: @booking.experience.title, start: @schedule.date, url: booking_path(@booking), user_id: @booking.experience.user.id, booking_id: @booking.id)
        # byebug
      redirect_to  booking_path(@booking)
      # (experience_id: @booking.experience_id, id: @booking.id)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to bookings_path
  end

  def cancel
    @booking = Booking.find(params[:id])
    UserMailer.rejected(User.find(@booking.user_id)).deliver_now
    redirect_to bookings_path, :alert => 'The booking has been cancelled.'
    @booking.delete
  end

  def testwo
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.experience.user == current_user
      return true
    else
      return false
    end
  end

  def test(test)
    @booking = test
    authorize @booking
    if @booking.confirmed = true
      return "Confirmed!"
    else
      return "Awaiting confirmation..."
    end
  end

  def confirm # for when you click "confirm". should hide buttons.
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    authorize @booking
    redirect_to booking_path(@booking), :notice => 'The booking has been confirmed!'
  end

  helper_method :test, :testwo

  private

  def booking_params # TODO: check to see if this works
    params.require(:booking).permit(:experience_id, :customer_id, :date, :schedule_id)
  end

end
