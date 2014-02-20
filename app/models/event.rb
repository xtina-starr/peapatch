class Event < ActiveRecord::Base
  def self.new_event(params)
    if Event.valid(params)
      calendar.create_event do |e|
        e.title = params[:title]
        e.start_time = Event.get_date(params[:start_time])
        e.end_time = Event.get_date(params[:end_time])
        e.content = params[:content]
        e.where = params[:where]
      end
    end
  end

  private
  def self.upcoming
    calendar.find_future_events(options = { order_by: 'starttime' }).reverse[0..4]
  end

  def self.valid(params)
    !params[:title].nil? && 
    Event.get_date(params[:start_time]) > Time.now && # start time > current time
    Event.get_date(params[:end_time]) > Event.get_date(params[:start_time]) # end time > start time
  end

  def self.get_date(time)
    Time.new(time["time(1i)"].to_i,
      time['time(2i)'].to_i,
      time['time(3i)'].to_i,
      time['time(4i)'].to_i,
      time['time(5i)'].to_i)
  end

  def self.calendar
    @calendar ||= Google::Calendar.new(
      username: ENV['EMAIL_ADDRESS'],
      password: ENV['EMAIL_PASSWORD'],
      app_name: 'adapeapatch',
      calendar: 'Community Events')
  end
end
