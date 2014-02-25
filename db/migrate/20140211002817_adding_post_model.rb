# Adding Post Model
class AddingPostModel < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.datetime :datetime
      t.text :content
      t.integer :user_id
    
      t.timestamps
    end
  end
end
