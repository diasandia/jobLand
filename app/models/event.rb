class Event < ApplicationRecord

  belongs_to :attendable, polymorphic: true
  belongs_to :user

 # def self.get_cal_events(passing_authorization, longstring)
 #    @@passing_authorization = passing_authorization
 #    @@refreshment = refreshment
 #    @@longstring = longstring
 #    result = api_client.list_events('primary')

 #    # execute(:api_method => @the_calendar.list_events('primary'), :authorization => passing_authorization)
 #    p "*" * 100
 #    # self.calendar
 #    p result.data
 #    result.data
 #  end


 #  private

 #  def self.api_client
 #    @client ||= begin

 #      service = Google::Apis::CalendarV3::CalendarService.new

 #    client = Signet::OAuth2::Client.new(client_options)
 #    client.update!(:access_token => @@passing_authorization,
 #      :refreshment => @@refreshment,
 #      :longstring => @@longstring)

 #      service.authorization = client
 #      @the_calendar = service
 #      @the_calendar

 #    end
 #  end


 #  def self.client_options
 #    {
 #      client_id: ENV['GOOGLE_CLIENT_ID'],
 #      client_secret: ENV['GOOGLE_CLIENT_SECRET'],
 #      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
 #      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
 #      scope: 'https//www.googleapis.com/auth/calendar',
 #      # scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
 #      redirect_uri: 'https://localhost:3000',
 #    }
 #  end

end

