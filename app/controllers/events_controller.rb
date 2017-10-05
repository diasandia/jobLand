class EventsController < ApplicationController
  def index
  end

  def new
    @job = Job.find(params[:job_id])
    @event = Event.new
  end

  def create
    p "*" * 10
    p "&"* 100
    p event_params
    @job = Job.find(params[:job_id])
    p params
    @event = @job.events.new(event_params)
    if @event.save
      redirect_to @job
    else
      p @errors
      @errors = @event.errors.full_messages
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :location, :datetime, :attendable_id, :attendable_type)
  end
end
