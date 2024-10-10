class DashboardController < ApplicationController
  def profile
    @user = current_user
    @my_skills = Skill.where(user_id: @user.id)
    @my_bookings = Booking.where(user_id: @user.id)
    @my_requests = Booking.where(skill_id: @my_skills.pluck(:id))
  end


end
