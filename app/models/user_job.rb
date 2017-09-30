class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :job_steps
  has_many :calendar_events, as: :attendable
  has_many :notes, as: :notable

  def jobs_by_phase
    @user_job = User_job.all



  end

end