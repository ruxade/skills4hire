class SkillsController < ApplicationController
  def index
    @search = params[:q]
    if @search
      @skills = Skill.where("LOWER(title) LIKE LOWER(?)",
          "%" + Skill.sanitize_sql_like(@search) + "%"
        )
    else
      @skills = Skill.all
    end
  end

  def show
    @skill = Skill.find(params[:id])
    @bookings = current_user.bookings
    @booking = @bookings.find_by(skill_id: @skill.id)
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

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy

    redirect_to skills_path, notice: "Skill was deleted"
  end

  private

  def skill_params
    params.require(:skill).permit(:title, :description, :price, :photo)
  end
end
