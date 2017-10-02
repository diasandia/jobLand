class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :user_jobs
  has_many :jobs, through: :user_jobs
  has_many :jobs_phases, through: :user_jobs
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
      false
    end
  end

  def self.from_omniauth(omniauth_data)
    # binding.pry
    user = User.find_by(uid: omniauth_data[:uid])

    if user
      return user
    else
      user = User.new(uid: omniauth_data[:uid],
                      first_name: omniauth_data[:first_name],
                      last_name: omniauth_data[:last_name],
                      email: omniauth_data[:email],
                      profile_picture: omniauth_data.extra.raw_info.picture,
                      google_access_token: omniauth_data.credentials.token)
      return user
    end
  end
end


