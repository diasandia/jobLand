class RubricsController < ApplicationController


  def new
    @rubric = current_user.rubrics.new
  end

  def create
    p rubric_params
    p "*" * 100
    @rubric = current_user.rubrics.new(rubric_params)
    p @rubric.errors.full_messages
    @rubric.save

    redirect_to current_user
  end

  def show
    @rubric = current_user.rubrics.all
  end

  private

  def rubric_params
    params.require(:rubric).permit(:standard_one,:standard_two, :standard_three)
  end

end

