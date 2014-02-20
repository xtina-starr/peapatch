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
      user
    else
      nil
    end
  end
end
