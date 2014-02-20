FactoryGirl.define do
  factory :post do
    title 'This is not the greatest post in the world'
    content 'This is just a tribute. Couldn\'t remember the greatest post in the world, so this is just a tribute'
    datetime Time.now
    user_id 1
  end

  factory :tool do
    id 1
    kind 'rake'
    user_id 1
  end

  factory :user do
    uid 'a uid'
    provider 'a provider'
    avatar_url 'an avatar_url'
    username 'username'
    email  'email'
    admin true
    access_token 'access_token'
    access_token_secret 'access_token_secret'
  end

  factory :comment do
    user_id 1
    post_id 1
    content 'Some sweet valid comment content'
    datetime Time.now
  end
end
