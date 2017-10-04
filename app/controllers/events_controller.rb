class EventsController < ApplicationController

  def index

  end

  def show
  end

  def calendars
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
  end

  private

  def client_options
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
