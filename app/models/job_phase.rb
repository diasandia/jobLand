class JobPhase < ApplicationRecord

  belongs_to :user_job
  belongs_to :user, through: :user_job
  belongs_to :phase
  has_many :notes, as: :notable
  has_many :events, as: :attendable

end
