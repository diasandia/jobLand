module JobsHelper
  def current_job
      @job = current_user.jobs.last
  end
end
