class UserJobsController < ApplicationController

  def new
    @user_job = UserJob.new
  end

  def index
    @user = current_user
    if @user
      @user_jobs = @user.user_jobs.all
    @jobs = @user.jobs.all
    @user_phase = @user.phases
    else
    redirect_to new_user_session_path
    end
  end

  def show

  end
end
