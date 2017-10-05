class Event < ApplicationRecord

  belongs_to :attendable, polymorphic: true

end
