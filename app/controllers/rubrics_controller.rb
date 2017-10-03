class RubricsController < ApplicationController


  def new
    @rubric = Rubric.new
  end

  def create
    p rubric_params
    p "*" * 100
    @rubric = current_user.rubrics.new(rubric_params)
    p @rubric.errors.full_messages
    @rubric.save

  end

  def show
    @rubric = Rubric.find(params[:id])
  end

  private

  def rubric_params
    params.require(:rubric).permit(:standard_one,:standard_two, :standard_three)
  end

end

