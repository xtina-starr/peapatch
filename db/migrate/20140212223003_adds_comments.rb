# Adds Comments
class AddsComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.integer :post_id
      t.datetime :datetime
      t.text :content
    end
  end
end
