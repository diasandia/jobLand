class JobsController < ApplicationController

 def new
    @job = Job.new
  end

  def index
    #change this to current user
    if current_user
      @jobs = current_user.jobs.all
    else
      redirect_to new_user_session_path
    end
  end

  def show
    p "*" * 100
    p params
    @user = current_user
    @job = current_user.jobs.find(params[:id])
    p @job
    @note = Note.new
  end

end
