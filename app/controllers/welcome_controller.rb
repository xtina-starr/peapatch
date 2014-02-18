class WelcomeController < ApplicationController

  def index
    Event.new_event({title: 'a title', start_time: Time.now, end_time: Time.now + (60*60)})
  end
end