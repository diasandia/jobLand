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
  end

end
