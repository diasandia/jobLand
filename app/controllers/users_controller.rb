class UsersController < ApplicationController
  def show
    @rubric = current_user.rubrics.last
    @new_rubric = Rubric.new
  end
end
