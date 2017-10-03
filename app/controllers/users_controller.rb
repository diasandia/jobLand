class UsersController < ApplicationController
  def show
  	@user = current_user
    @rubric = Rubric.new
  end

end
