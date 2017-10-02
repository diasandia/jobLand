class Phase < ApplicationRecord
  has_many :job_phases
  has_many :users, through: :job_phases
end