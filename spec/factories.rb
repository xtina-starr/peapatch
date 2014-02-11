FactoryGirl.define do 
  factory :post do 
    title 'This is not the greatest post in the world'
    content 'This is just a tribute. Couldn\'t remember the greatest post in the world, so this is just a tribute'
    datetime Time.now
    user_id 1
  end

  factory :user do
    uid '12345677'
    provider 'Twitter'
    avatar_url 'thisisaurl.com'
    username 'MrCool'
    email 'mrcool@cool.com'
    admin 'false'
    access_token 'somenumbers12345'
    access_token_secret 'shhhitsasecret12345'
  end
end