class CalendarsController < ApplicationController
  def index
    @event = Event.new
    # Event.new_event({title: 'a title', start_time: Time.now, end_time: Time.now + (60*60)})
  end

  def create
    Event.new_event(params)
    redirect_to :back
  end
end