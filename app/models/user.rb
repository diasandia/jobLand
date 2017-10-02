class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :job_phases, through: :user_jobs
  has_many :phases, through: :job_phases

  has_many :events
  has_many :user_events
  has_many :networking_events, through: :user_events
  has_many :user_points
  has_many :point_categories, through: :user_points
  has_many :notes


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
      user = User.find_by(email: data.email)
      if user
        user.provider = access_token.provider
        user.uid = access_token.uid
        user.token = access_token.credentials.token
        user.save
        user
      else
        redirect_to new_user_registration_path, notice: "Error."
      end
  end

  def total_points
    self.user_points.reduce(0) { |sum, points| sum + points.point_category.number_of_points}
  end

end


