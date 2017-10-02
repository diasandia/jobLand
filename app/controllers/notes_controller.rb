class NotesController < ApplicationController
  def create
    if params[:user_job_id]
      @user_job = UserJob.find(params[:user_job_id])
    elsif params[:job_phase_id]
      @job_phase_id = JobPhase.find(params[:job_phase_id])
    elsif params[:user_networking_event]
      @user_networking_event = UserNetworkingEvent.find(params[:user_networking_event])
    end

    @resource = UserJob.find_by(id: params[:user_job_id]) || JobPhase.find_by(id: params[:job_phase_id]) ||

    @note = @resource.notes.create


  end

  def update
  end

  def delete
  end
end
