class WelcomeController < ApplicationController

  def index
    @events = Event.upcoming
    @five_posts = Post.all.reverse[0..4]
  end
end