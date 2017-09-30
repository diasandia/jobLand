 class NetworkingEvent < ApplicationRecord

  has_many :calendar_events, as: :attendable
  belongs_to :user

end