class UserJobsController < ApplicationController

  def new
    @user_job = UserJob.new
  end

  def index
    @user_jobs = current_user.user_jobs.all
  end

  def show
    # @user_jobs = current_user.user_jobs
    #change this once login works
    @user_job = UserJob.first
    @note = Note.new
  end
end
