class CalendarEvent < ApplicationRecord
  has_many :attendable, polymorphic: :true
  belongs_to :user
end
