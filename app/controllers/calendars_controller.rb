class CalendarsController < ApplicationController
  before_action :make_dates, only: :create
  def index
    @event = Event.new
    if @current_user.nil?
      redirect_to '/', notice: 'You must be a logged-in user to do that'
    elsif @current_user.email.nil?
      redirect_to profile_path, notice: 'You need to complete your profile to do that'
    end
    # Event.new_event({title: 'a title', start_time: Time.now, end_time: Time.now + (60*60)})
  end

  def make_dates
    @start_time = Event.get_date(params[:start_time])
    @end_time = Event.get_date(params[:end_time])
  end

  def create
    @event = Event.new(event_params)
    # I know that this is terrible and hacky. It exists because I could not make it work
    # the correct way and this issue was blocking me from making better progress.
    @event.start_time = @start_time
    @event.end_time = @end_time
    if @event.save
      Event.new_google_event(params)
      # this value is the difference in days between the event start time and the current day
      # We don't actually want to send an email if it is fewer than one day away
      if (@event.start_time - Time.now).to_i > 0
        # should be changed from minutes to days after testing
        Resque.enqueue_in( 2.minutes, EventReminderEmailJob, @event.id )
      end
      redirect_to :back
    else
      redirect_to :back, notice: 'That is not a valid event!'
    end
  end

  def event_params
    params.permit(:title, :content, :where)
  end
end