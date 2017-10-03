class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and
devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :jobs
  has_many :events
  has_many :user_events
  has_many :networking_events, through: :user_events
  has_many :user_points
  has_many :point_categories, through: :user_points
  has_many :notes, as: :notable


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
    where(provider: omniauth_data.provider, uid: omniauth_data.uid).first_or_create do |user|
      user.uid = omniauth_data.uid
      user.provider = omniauth_data.provider
      user.email = omniauth_data.info.email
      user.password = Devise.friendly_token[0,20]
      user.first_name = omniauth_data.info.first_name   # assuming the user model has a name
      user.last_name = omniauth_data.info.last_name   # assuming the user model has a name
      # user.image = omniauth_data.info.image # assuming the user model has an image
      user.profile_picture = omniauth_data.extra.raw_info.picture
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
    # User.find_or_create_by(
    #   uid: omniauth_data.uid,
    #   provider: omniauth_data.provider,
    #   token: omniauth_data.credentials.token,
    #   first_name: omniauth_data.info.first_name,
    #   last_name: omniauth_data.info.last_name,
    #   email: omniauth_data.info.email,
    #   profile_picture: omniauth_data.extra.raw_info.picture,
    #   google_access_token: omniauth_data.credentials.refresh_token
    # )
  end

  def total_points
    self.user_points.reduce(0) { |sum, points| sum + points.point_category.number_of_points}
  end
end


