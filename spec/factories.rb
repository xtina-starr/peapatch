FactoryGirl.define do 
  factory :post do 
    title 'This is not the greatest post in the world'
    content 'This is just a tribute. Couldn\'t remember the greatest post in the world, so this is just a tribute'
    datetime Time.now
    user_id 1
  end
end