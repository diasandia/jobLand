module UserJobsHelper

  def current_phase
    @user_job.job_phases.last.phase.phase_name
  end

end
