class SkillsController < ApplicationController
  def index
    @skills = Skill.all
  end

  def show
    @skill = Skill.find(params[:id])
    booking = current_user.bookings.where(status: "confirmed").last
    @booking = booking if booking.review == nil
    @review = Review.new
  end

  def edit
    @skill = Skill.find(params[:id])
  end

  def update
    @skill = Skill.find(params[:id])
    if @skill.update(skill_params)
      redirect_to @skill, notice: 'Skill was successfully created.'
    else
      render :edit
    end
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)

    # Assuming users must be signed in to create skills
    @skill.user = current_user

    if @skill.save
      redirect_to @skill, notice: 'Skill was successfully created.'
    else
      render :new
    end
  end

  private

  def skill_params
    params.require(:skill).permit(:title, :description, :price, :photo)
  end
end
