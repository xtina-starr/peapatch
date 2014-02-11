class CalendarController < ApplicationController

  def client
    client = GoogleCalendar::Client.new(ENV["GOOGLE_ID"], ENV["GOOGLE_KEY"], ENV["GOOGLE_SECRET"])
  end
  
  def index
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Event.event_strips_for_month(@shown_month)
  end
  
end
