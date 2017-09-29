class JobStep < ApplicationRecord

  belongs_to :user_job
  belongs_to :user, through: :user_job
  belongs_to :step
  belongs_to :notable, polymorphic: true

end
