class User < ActiveRecord::Base
  has_many :posts
  has_many :comments
  validates :uid, :username, :provider, presence: true

  def self.find_or_create_from_omniauth(auth_hash)
    user = User.find_by(uid: auth_hash['uid']) || create_from_omniauth(auth_hash)
    user.update(access_token:        auth_hash['credentials']['token'],
                access_token_secret: auth_hash['credentials']['secret']
                )
    user
  end

  def self.create_from_omniauth(auth_hash)
    user = self.create(
      uid:                 auth_hash['uid'],
      provider:            auth_hash['provider'],
      avatar_url:          auth_hash['info']['image'],
      username:            auth_hash['info']['nickname'],
      access_token:        auth_hash['credentials']['token'],
      access_token_secret: auth_hash['credentials']['secret']
      )
    if user.valid?
      @user = user
    else
      nil
    end
  end

  def self.user_client(user)
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = user.token
      config.access_token_secret = user.secret
    end
  end
end
