class UserJobsController < ApplicationController

  def new
    @user_job = UserJob.new
  end

  def index
    #change this to be current user once I'm logged in
    @current_user = User.first
    @user_jobs = current_user.user_jobs.all
  end

  def show
    #change this once login works
    @user_job = UserJob.first
    @note = Note.new
  end
end
