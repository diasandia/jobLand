class JobsController < ApplicationController

  protect_from_forgery :except => [:create]

  def new
    @job = Job.new
  end

  def index

    if current_user
      @jobs = current_user.jobs.all
      @accepted_jobs = @jobs.where(current_phase: "Accepted")
      @offered_jobs = @jobs.where(current_phase: "Offer")
      @checking_references_jobs = @jobs.where(current_phase: "Checking References")
      @onsite_interview_jobs = @jobs.where(current_phase: "Onsite Interview")
      @phone_screen_jobs = @jobs.where(current_phase: "Technical Phone Screen")
      @info_interview_jobs = @jobs.where(current_phase: "Informational Interview")
      @applied_jobs = @jobs.where(current_phase: "Applied")
      @wishlist_jobs = @jobs.where(current_phase: "Wishlist")

        if !current_user.rubrics.last
          redirect_to current_user
        end
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @job = current_user.jobs.find(params[:id])
    @note = Note.new
    @event = Event.new
  end

  def create
    if params[:job] #is this the form or the extension?
      @user = current_user
      @job = Job.new(
              url: params[:job][:url],
              company: params[:job][:company],
              job_title: params[:job][:job_title],
              description: params[:job][:description],
              user: @user,
              current_phase: "Wishlist"
              )
    else
      @user = User.find_by(email: params[:email])
      @job = Job.new(
              url: params[:url],
              company: params[:company],
              job_title: params[:job_title],
              description: params[:description],
              user: @user,
              current_phase: "Wishlist"
              )
    end
    @job.save

    respond_to do |format|
      format.html { redirect_to jobs_path }
      format.js
    end
  end

  def update
    @job = Job.find(params[:id])

    if params[:current_phase]
      if @job.update(current_phase: params[:current_phase])
        redirect_to @job
      else
        render 'edit'
     end
    else
      if @job.update(job_params)
        respond_to do |format|
          format.html { redirect_to job_path}
          format.js
        end
      else
        render :edit
      end
    end
  end

  def edit
    @job = Job.find(:id)
    @phases = ["Wishlist","Applied","Informational Interview","Phone Screen","Technical Phone Screen","Onsite Interview","Checking references","Offer","Accepted"]
  end

  private

  def job_params
    params.require(:job).permit(:criteria_one_score, :criteria_two_score, :criteria_three_score)
  end
end
