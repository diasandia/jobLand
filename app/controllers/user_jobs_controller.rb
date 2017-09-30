class UserJobsController < ApplicationController
  def index
    @user_job = User_job.all
  end

  def show
  end
end
