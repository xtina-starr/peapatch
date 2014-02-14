class ChangeToolsColumnName < ActiveRecord::Migration
  def change
    remove_column :tools, :type, :string
    add_column :tools, :kind, :string 
  end
end
