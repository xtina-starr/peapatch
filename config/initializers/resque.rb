require 'resque_scheduler'

Resque.redis = 'localhost:6379'
Resque.redis.namespace = "resque:AdaPeaPatch"

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }

# The schedule doesn't need to be stored in a YAML, it just needs to
# be a hash.  YAML is usually the easiest.
Resque.schedule = YAML.load_file(Rails.root.join('config', 'resque_schedule.yml'))