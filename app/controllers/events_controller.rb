class EventsController < ApplicationController

  # def index

  # end

  # def show
  # end

  # def calendars
  #   client = Signet::OAuth2::Client.new(client_options)
  #   client.update!(session[:authorization])

  #   service = Google::Apis::CalendarV3::CalendarService.new
  #   service.authorization = client

  #   @calendar_list = service.list_calendar_lists
  # end

  # private

  # def client_options
  #   {
  #     client_id: ENV['GOOGLE_CLIENT_ID'],
  #     client_secret: ENV['GOOGLE_CLIENT_SECRET'],
  #     authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
  #     token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
  #     scope: 'https//www.googleapis.com/auth/calendar',
  #     # scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
  #     redirect_uri: 'https://localhost:3000'
  #   }
  # end



######Here's what we should do after lunch:
## get to the calendars method in the controller. We want to render the index erb file and pass through locals that have the information from google calendar.

  def events
    result = api_client.execute(:api_method => calendar.events.list,
                            :parameters => {'calendarId' => 'primary'},
                            :authorization => user_credentials)
    result.data
  end

  def calendars
    events
  end


  private

  def api_client
    @client ||= begin
      client = Google::APIClient.new(application_name: 'JobLand', application_version: '0.0.1')
      client.authorization.client_id = ENV["GOOGLE_CLIENT_ID"]
      client.authorization.client_secret = ENV["GOOGLE_CLIENT_SECRET"]
      client.authorization.scope = 'https://www.googleapis.com/auth/calendar'
      client
    end
  end

  def calendar
    @calendar ||= api_client.discovered_api('calendar', 'v3')
  end

  def user_credentials
    auth = api_client.authorization.dup
    # @user.credentials is an OmniAuth::AuthHash  cerated from request.env['omniauth.auth']['credentials']
    auth.update_token!(access_token: current_user.credentials.token)
    auth
  end
end
