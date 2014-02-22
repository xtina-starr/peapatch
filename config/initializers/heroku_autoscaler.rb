HerokuResqueAutoscaler.configure do |c|
  c.heroku_app_name  = ENV['HEROKU_APP']
  c.heroku_api_key = ENV['HEROKU_API_KEY']
end