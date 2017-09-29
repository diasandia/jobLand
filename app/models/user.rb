class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :calendar_events
  has_many :user_points
  has_many :point_categories

end
