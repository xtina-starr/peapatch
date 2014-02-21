class EventMailer < ActionMailer::Base
  default from: "adapeapatch@gmail.com"

  def upcoming_event(event_id)
    @event = Event.find(event_id)
    User.all.each do |user|
      mail(to: user.email, subject: "Reminder: #{@event.title} is coming up!")
    end
  end
end