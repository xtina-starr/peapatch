class PostMailer < ActionMailer::Base
  default from: "adapeapatch@gmail.com"

  def self.new_post(post_id)
    @post = Post.find(post_id)
    User.all.each do |user|
      mail(to: user.email, subject: "New post: #{@post.title}")
    end
  end
end