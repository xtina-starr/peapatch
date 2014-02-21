require 'resque_heroku_autoscaler'

Resque::Plugins::HerokuAutoscaler.config do |c|
  c.heroku_app  = ENV['HEROKU_APP']
  c.heroku_api_key = ENV['HEROKU_API_KEY']
end