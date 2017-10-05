class RubricsController < ApplicationController

  def new
    @rubric = current_user.rubrics.new
  end

  def create
    @rubric = current_user.rubrics.new(rubric_params)
    
    if @rubric.save
      redirect_to current_user
    else
      @errors = @rubric.errors.full_messages
      render :new
    end
  end

  def show
    @rubric = current_user.rubrics.last
  end

  def edit
    @rubric = current_user.rubrics.last
  end

  def update
    @rubric = current_user.rubrics.last

    if @rubric.update(rubric_params)
      redirect_to current_user
    else
      @errors = @rubric.errors.full_messages
      render :edit
    end
  end

  private

  def rubric_params
    params.require(:rubric).permit(:standard_one,:standard_two, :standard_three)
  end
end

