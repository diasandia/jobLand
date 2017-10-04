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
    @user = current_user
    @job = current_user.jobs.find(params[:id])

    p @job
    @note = Note.new
  end

<<<<<<< HEAD
   def update
    @user= current_user
    job= Job.find(params[:id])
    if job.update(job_params)
      respond_to do |format|
        format.html { redirect_to job_path}
        format.js
      end
    else
      render :edit
    end
  end


  private
  def job_params
    params.require(:job).permit(:criteria_one_score, :criteria_two_score, :criteria_three_score)
=======

  def create
    @user = User.find_by(email: params[:email])
    @job = Job.create(url: params[:url], company: params[:company], job_title: params[:job_title], description: params[:description], user: @user, current_phase: "Wishlist")
      render json: {status: 200}
  end

  def edit
    @job = Job.find(:id)
    @phases = ["Wishlist","Applied","Informational Interview","Phone Screen","Technical Phone Screen","Onsite Interview","Checking references","Offer","Accepted"]
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(current_phase: params[:current_phase])
      redirect_to @job
    else
      render 'edit'
    end
>>>>>>> development
  end

end
