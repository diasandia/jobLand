class UserNetworkingEvent < ApplicationRecord
  belongs_to :user
  belongs_to :networking_event
  belongs_to :attendable, polymorphic: true
end
