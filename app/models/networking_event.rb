 class NetworkingEvent < ApplicationRecord

  has_many :users, through: :user_events

end