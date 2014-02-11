class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :avatar_url
      t.string :username
      t.string :email
      t.boolean :admin, default: false 
      t.string :access_token
      t.string :access_token_secret

      t.timestamps
    end
  end
end
