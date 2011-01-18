class AddUserIdToRepository < ActiveRecord::Migration
  def self.up
     add_column :repositories, :user_id, :integer, :null => false
  end

  def self.down
     remove_column :reopsitories, :user_id
  end
end
