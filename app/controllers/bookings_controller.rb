class BookingsController < ApplicationController
  before_action :check_logged_in

  def index
    @bookings = current_user.bookings

  end

  def new
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.new
  end

  def create
    @skill = Skill.find(params[:skill_id])
    @booking = Booking.create(booking_params)
    @booking.skill = @skill
    @booking.user = current_user
    @booking.save

    redirect_to bookings_path
  end

  # private

  def booking_params
    params.require(:booking).permit(:status, :skill_id)
  end

  def check_logged_in
    if !current_user
      redirect_to new_user_session_path
    end
  end
end
