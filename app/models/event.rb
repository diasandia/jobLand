class Event < ApplicationRecord

  belongs_to :attendable, polymorphic: true
  belongs_to :user

 def self.get_cal_events(passing_authorization)
    @@passing_authorization = passing_authorization
    result = api_client.execute(:api_method => @the_calendar.list_events('primary'), :authorization => passing_authorization)
    p "*" * 100
    # self.calendar
    p result.data
    result.data
  end


  private

  def self.api_client
    @client ||= begin
      # client = Google::Apis::CalendarV3::CalendarService.new(application_name: 'JobLand', application_version: '0.0.1')
      service = Google::Apis::CalendarV3::CalendarService.new

    client = Signet::OAuth2::Client.new(client_options)
    client.update!({authorization: @@passing_authorization})

      service.authorization = client
      service.authorization.client_id = ENV["GOOGLE_CLIENT_ID"]
      service.authorization.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
      service.authorization.scope = 'https://www.googleapis.com/auth/calendar'
      p "%" * 1000
      @the_calendar = service
      client
      # binding.pry

    end
  end

  # def self.calendar
  #   @calendar ||= @@the_calendar
  # end

   def self.user_credentials
    auth = api_client.authorization.dup
    # @user.credentials is an OmniAuth::AuthHash  cerated from request.env['omniauth.auth']['credentials']
    auth.update_token!(access_token: current_user.credentials.token)
    auth
  end


  def self.client_options
    {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: 'https//www.googleapis.com/auth/calendar',
      # scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: 'https://localhost:3000'
    }
  end

end

