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

#why is calendars not showing the events that we're calling inside t- events aren't showing up in it, but they should



  def calendars
    @user = current_user
    passing_authorization = @user.google_access_token
    @results = Event.get_cal_events(passing_authorization)
  end



end
