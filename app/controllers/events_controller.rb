class EventsController < ApplicationController
  def index
  end

  def new
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
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime)
end
