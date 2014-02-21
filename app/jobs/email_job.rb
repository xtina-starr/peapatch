class EmailJob
  # extend HerokuResqueAutoscaler if Rails.env.production?

  @queue = :email

  def self.perform(post_id)
    PostMailer.new_post(post_id).deliver
  end
end