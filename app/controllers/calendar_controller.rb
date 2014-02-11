class CalendarController < ApplicationController

  def client
    client = GoogleCalendar::Client.new(ENV["GOOGLE_ID"], ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"])
  end

end