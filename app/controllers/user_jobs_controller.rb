class UserJobsController < ApplicationController

  def new
    @user_job = UserJob.new
  end

  def index
    @user = User.find(params[:id])
    @user_jobs = UserJob.all
  end

  def show
  end
end
