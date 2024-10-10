class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking

    if @review.save
      redirect_to skill_path(@booking.skill)
    end
  end
  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
