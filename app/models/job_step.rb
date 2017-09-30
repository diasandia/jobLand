class JobStep < ApplicationRecord

  belongs_to :user_job
  belongs_to :user, through: :user_job
  has_many :steps
  has_many :notes, as: :notable

end
