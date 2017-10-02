class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :job_phases
  has_many :phases, through: :job_phases
  has_many :events, as: :attendable
  has_many :notes, as: :notable

def find_job_phase_id
end

end