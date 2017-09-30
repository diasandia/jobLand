class UserPoint < ApplicationRecord

  belongs_to :user
  belongs_to :point_category

end