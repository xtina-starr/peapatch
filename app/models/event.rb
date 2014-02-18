class Event < ActiveRecord::Base
  validates_presence_of :title
  def self.new_event(params)
    calendar.create_event do |e|
      puts params[:start_time]
      e.title = params[:title]
      e.start_time = params[:start_time]
      e.end_time = params[:end_time]
      e.content = params[:content]
      e.where = params[:where]
    end
  end

  private
  def self.calendar
    @calendar ||= Google::Calendar.new(
      username: ENV['EMAIL_ADDRESS'], 
      password: ENV['EMAIL_PASSWORD'], 
      app_name: 'adapeapatch', 
      calendar: 'Community Events')
  end
end