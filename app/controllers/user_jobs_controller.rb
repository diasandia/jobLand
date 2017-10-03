class UserJobsController < ApplicationController

  def new
    @user_job = UserJob.new
  end

  def index
    if current_user
      @user_jobs = current_user.user_jobs.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    # @user_jobs = current_user.user_jobs
    #change this once login works
    @user_job = UserJob.first
    @note = Note.new
  end
end
