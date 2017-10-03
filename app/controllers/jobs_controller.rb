class JobsController < ApplicationController

 def new
    @user_job = UserJob.new
  end

  def index
    #change this to current user
    @test_user = User.first
    @jobs = @test_user.jobs.all
  end

  def show
    @user = current_user
    @job = @user.jobs.find(params[:id])
    @note = Note.new
  end

end
