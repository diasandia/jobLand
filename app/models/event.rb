class Event < ApplicationRecord

  belongs_to :attendable, polymorphic: true
  belongs_to :user

 def self.get_cal_events
    result = api_client.execute(
      :api_method => calendar.events.list,
      :parameters => {'calendarId' => 'primary'},
      :authorization => user_credentials)
    p "*" * 100
    # self.calendar
    p result.data
  end


  private

  def self.api_client
    @client ||= begin
      # client = Google::Apis::CalendarV3::CalendarService.new(application_name: 'JobLand', application_version: '0.0.1')
      client = Google::Apis::CalendarV3::CalendarService.new
      client.authorization.client_id = ENV["GOOGLE_CLIENT_ID"]
      client.authorization.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
      client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
      client
    end
  end

  def self.calendar
    @calendar ||= api_client.discovered_api('calendar', 'v3')
  end

   def self.user_credentials
    auth = api_client.authorization.dup
    # @user.credentials is an OmniAuth::AuthHash  cerated from request.env['omniauth.auth']['credentials']
    auth.update_token!(access_token: current_user.credentials.token)
    auth
  end


end

