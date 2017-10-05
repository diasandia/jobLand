class Event < ApplicationRecord

  belongs_to :attendable, polymorphic: true
  belongs_to :user

 def self.get_cal_events(passing_authorization)
    @@passing_authorization = passing_authorization

    @result = api_client

    # execute(:api_method => @the_calendar.list_events('primary'), :authorization => passing_authorization)
    p "*" * 100
    # self.calendar
    @result
  end


  private

  def self.api_client
    @client ||= begin

    # service = Google::Apis::CalendarV3::CalendarService.new

    # client = Signet::OAuth2::Client.new(client_options)
    # client.authorization.access_token = @@passing_authorization

    #   service.authorization = client
    #   @the_calendar = service
    #   @the_calendar
    Google::Apis::RequestOptions.default.authorization = @@passing_authorization

    client = Google::Apis::CalendarV3::CalendarService.new
    # client = Google::APIClient.new

    # client.authorization.access_token = @@passing_authorization
    client
    # service = client.discovered_api('calendar', 'v3')
    # @result = client.execute(
    #   :api_method => service.calendar_list.list,
    #   :parameters => {},
    #   :headers => {'Content-Type' => 'application/json'})
    end
  end


  def self.client_options
    {
      client_id: ENV['GOOGLE_CLIENT_ID'],
      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: 'https//www.googleapis.com/auth/calendar',
      # scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: 'https://localhost:3000',
    }
  end

end

