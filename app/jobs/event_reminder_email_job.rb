class EventReminderEmailJob
  @queue = :scheduled_email
  def self.perform(event_id)
    EventMailer.upcoming_event(event_id).deliver
  end
end