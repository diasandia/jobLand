class UserJob < ApplicationRecord
  belongs_to :user
  belongs_to :job
  has_many :job_steps
  has_many :attendable, polymorphic: true
  belongs_to :notable, polymorphic: true
end