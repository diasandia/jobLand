class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :job_phases
  has_many :events, as: :attendable
  has_many :notes, as: :notable



end