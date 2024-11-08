class BookingsController < ApplicationController
  before_action :check_logged_in
  before_action :set_booking, only: [:accept, :decline, :destroy]

  def index
    @bookings = current_user.bookings
  end

  def new
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.new(booking_params)
    @booking.skill = @skill
    @booking.user = current_user

    if @booking.save
      redirect_to bookings_path, notice: "Booking successfully created"
    else
      flash[:alert] = "Booking could not be created. Please check your input."
      render :new
    end
  end



  def accept
    if @booking.update(status: "accepted")
      redirect_to profile_path, notice: "Booking accepted"
    else
      redirect_to profile_path, alert: "Unable to accept booking"
    end
  end

  def decline
    if @booking.update(status: "declined")
      redirect_to profile_path, notice: "Booking declined"
    else
      redirect_to profile_path, alert: "Unable to decline booking"
    end
  end

  def destroy
    if @booking.destroy
      redirect_to bookings_path, notice: "Booking deleted"
    else
      redirect_to bookings_path, alert: "Unable to delete booking"
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:message, :date)
  end

  def check_logged_in
    redirect_to new_user_session_path unless current_user
  end
end
