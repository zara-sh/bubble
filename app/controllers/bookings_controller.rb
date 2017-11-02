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
    authorize @booking
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
        Event.create(title: @booking.experience.title, start: @schedule.date, url: booking_path(@booking), user_id: current_user.id)
        Event.create(title: @booking.experience.title, start: @schedule.date, url: booking_path(@booking), user_id: @booking.experience.user.id)
      redirect_to  booking_path(@booking)
      # (experience_id: @booking.experience_id, id: @booking.id)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.delete
    redirect_to bookings_path
  end

  private

  def booking_params # TODO: check to see if this works
    params.require(:booking).permit(:experience_id, :customer_id, :date, :schedule_id)
  end

end
