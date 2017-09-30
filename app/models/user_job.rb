class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :job_steps
  has_many :calendar_events, as: :attendable
  has_many :notes, as: :notable
end