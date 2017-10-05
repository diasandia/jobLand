class NotesController < ApplicationController
  
  def create
    @job = Job.find(params[:job_id])

    if params[:job_id]
      @job = Job.find(params[:job_id])
    elsif params[:job_phase_id]
      @job_phase_id = JobPhase.find(params[:job_phase_id])
    elsif params[:user_networking_event]
      @user_networking_event = UserNetworkingEvent.find(params[:user_networking_event])
    end

    @note = @job.notes.new(description: params[:note][:description])

    if @note.save
      respond_to do |format|
        format.html { redirect_to @job }
        format.js
      end
    else
      @errors = @note.errors.full_messages
      redirect_to @job
    end
  end

  def update
  end

  def delete
  end

  private

  def note_params
   params.require(:note).permit(:description)
  end
end
