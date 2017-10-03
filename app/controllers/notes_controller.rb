class NotesController < ApplicationController
  def create
    p "%" * 100
    p params[:note][:decription]
    p "THAT WAS PARAMS"
    if params[:job_id]
      @job = Job.find(params[:job_id])
    elsif params[:job_phase_id]
      @job_phase_id = JobPhase.find(params[:job_phase_id])
    elsif params[:user_networking_event]
      @user_networking_event = UserNetworkingEvent.find(params[:user_networking_event])
    end
    @note = @job.notes.new(description: params[:note][:description])
    p "$" * 100
    p @note
    puts "@note.valid?: #{@note.valid?}"
    puts "@note.errors: #{@note.errors}"
    puts "@note.errors.full_messages: #{@note.errors.full_messages}"
    p "THAT WAS the NOTE"
    if @note.save
      redirect_to root_path
    else
      @errors = @note.errors.full_messages
      redirect_to root_path
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
