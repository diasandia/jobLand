 class NetworkingEvent < ApplicationRecord

  has_many :users, through: :user_networking_events

end