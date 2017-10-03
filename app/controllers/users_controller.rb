class UsersController < ApplicationController

  def show
  	@user = User.find(params[:id])
    @rubric = @user.rubrics.last
    p "* " * 100
    p params
    p "THAT WAS PARAM"
    @new_rubric = Rubric.new
  end

  def edit
    @user = User.find(params[:id])
    @new_rubric = @user.rubrics.create(standard_one: params[:standard_one], standard_two: params[:standard_two], standard_three: params[:standard_three])
  end

  def update
  end

  # private

  # def rubric_params
  #  params.require(:rubric).permit(:standard_one, :standard_two, :standard_three)
  # end

end
