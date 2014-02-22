class Event < ActiveRecord::Base  
  validates_presence_of :title
  validates_presence_of :start_time
  validate :start_time_cannot_be_in_the_past, :end_time_must_be_after_start_time

  def start_time_cannot_be_in_the_past
    if start_time.present? && start_time < Time.now
      errors.add(:start_time, "must be in the future")
    end
  end

  def end_time_must_be_after_start_time
    if end_time.present? && start_time.present? && end_time < start_time
      errors.add(:end_time, "must end after it begins")
    end
  end

  def self.new_google_event(params)
    calendar.create_event do |e|
      e.title = params[:title]
      e.start_time = Event.get_date(params[:start_time])
      e.end_time = Event.get_date(params[:end_time])
      e.content = params[:content]
      e.where = params[:where]
    end
  end

  def self.get_date(time)
    Time.new(time["time(1i)"].to_i,
      time['time(2i)'].to_i,
      time['time(3i)'].to_i,
      time['time(4i)'].to_i,
      time['time(5i)'].to_i)
  end

  private
  def self.upcoming
    calendar.find_future_events(options={order_by: 'starttime'}).reverse[0..4]
  end

  def self.calendar
    @calendar ||= Google::Calendar.new(
      username: ENV['EMAIL_ADDRESS'],
      password: ENV['EMAIL_PASSWORD'],
      app_name: 'adapeapatch',
      calendar: 'Community Events')
  end
end
