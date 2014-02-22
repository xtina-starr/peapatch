class AddsEventsDatabase < ActiveRecord::Migration
  def change
    drop_table :events
    
    create_table :events do |t|
      t.string :title
      t.datetime :start_time
      t.datetime :end_time
      t.text :content
      t.string :where

      t.timestamps
    end
  end
end
