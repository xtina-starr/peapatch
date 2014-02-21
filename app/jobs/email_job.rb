require 'resque_heroku_autoscaler'

class EmailJob
  extend Resque::Plugins::HerokuAutoscaler

  @queue = :email

  def self.perform(post_id)
    PostMailer.new_post(post_id).deliver
  end
end