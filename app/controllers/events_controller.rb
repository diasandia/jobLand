class EventsController < ApplicationController
  def index
  end

  def new
    @job = Job.find(params[:job_id])
    @event = Event.new
  end

  def create
    @job = Job.find(params[:job_id])

    if params[:job_id]
      @job = Job.find(params[:job_id])
    elsif params[:job_phase_id]
      @job_phase_id = JobPhase.find(:job_phase_id)
    end

    @event = @job.events.new
    if @event.save
      respond_to do |format|
        format.html { redirect_to @job }
      end
    else
      @errors = @event.errors.full_messages
      redirect_to @job
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime)
  end
end
