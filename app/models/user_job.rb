class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :job_phases
  has_many :events, as: :attendable
  has_many :notes, as: :notable

  def current_phase
    self.job_phases.last.phase.phase_name
  end
end