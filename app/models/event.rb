

class Event < ApplicationRecord

  belongs_to :attendable, polymorphic: true
  belongs_to :user

end

