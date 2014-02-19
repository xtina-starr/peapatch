class CalendarsController < ApplicationController
  def index
    @event = Event.new
    if @current_user.nil?
      redirect_to '/', notice: 'You must be a logged-in user to do that'
    elsif @current_user.email.nil?
      redirect_to profile_path, notice: 'You need to complete your profile to do that'
    end
    # Event.new_event({title: 'a title', start_time: Time.now, end_time: Time.now + (60*60)})
  end

  def create
    if Event.valid(params)
      Event.new_event(params)
      redirect_to :back
    else
      redirect_to :back, notice: 'That is not a valid event!'
    end
  end
end