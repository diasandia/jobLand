class UsersController < ApplicationController
  def show
  	@user = current_user
    @new_rubric = Rubric.new
    @rubric = current_user.rubrics.last
  end

end
