class UserJobsController < ApplicationController

  def new
    @user_job = UserJob.new
  end

  def index
    # @user_jobs = current_user.user_jobs
  end

  def show
    #change this once login works
    @user_job = UserJob.first

  end
end
