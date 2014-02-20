# encoding: UTF-8


ActiveRecord::Schema.define(version: 20140212230600) do

  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'comments', force: true do |t|
    t.integer  'user_id'
    t.integer  'post_id'
    t.datetime 'datetime'
    t.text     'content'
  end

  create_table 'events', force: true do |t|
    t.string   'name'
    t.datetime 'start_at'
    t.datetime 'end_at'
    t.text     'description'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'posts', force: true do |t|
    t.string   'title'
    t.datetime 'datetime'
    t.text     'content'
    t.integer  'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  create_table 'tools', force: true do |t|
    t.integer  'user_id'
    t.datetime 'created_at'
    t.datetime 'updated_at'
    t.string   'kind'
  end

  create_table 'users', force: true do |t|
    t.string   'uid'
    t.string   'provider'
    t.string   'avatar_url'
    t.string   'username'
    t.string   'email'
    t.boolean  'admin',               default: false
    t.string   'access_token'
    t.string   'access_token_secret'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

end
