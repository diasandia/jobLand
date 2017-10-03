class JobsController < ApplicationController

  protect_from_forgery :except => [:create]

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


  def create
    @user = User.find_by(email: params[:email])
    @job = Job.create(url: params[:url], company: params[:company], job_title: params[:job_title], description: params[:description], user: @user, current_phase: "Wishlist")
      render json: {status: 200}
  end

end
