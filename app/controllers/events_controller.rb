class EventsController < ApplicationController



  # def redirect
  #   client = Signet::OAuth2::Client.new(client_options)
  #   p "@" * 200
    # client.update!(session[:authorization])

    # service = Google::Apis::CalendarV3::CalendarService.new
    # service.authorization = client

    # @calendar_list = service.list_calendar_lists
  #   redirect_to client.authorization_uri.to_s
  # end

  # def callback
  #   client = Signet::OAuth2::Client.new(client_options)
  #   p "%" * 100
  #   client.code = params[:code]

  #   response = client.fetch_access_token!

  #   session[:authorization] = response

  #   redirect_to calendars_url
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
  #     authorization_uri: user_google_oauth2_omniauth_authorize_path,
  #     token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
  #     scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
  #     # scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
  #     redirect_uri: callback_url
  #   }
  # end



######Here's what we should do after lunch:
## get to the calendars method in the controller. We want to render the index erb file and pass through locals that have the information from google calendar.

#why is calendars not showing the events that we're calling inside t- events aren't showing up in it, but they should

# THIS ONE HITS THE EVENT MODEL

  # def calendars
  #   user = current_user
  #   # refreshment = user.refreshment
  #   longstring = user.id_token
  #   passing_authorization = user.google_access_token
  #   @results = Event.get_cal_events(passing_authorization, refresh_token, id_token)
  # end



end
