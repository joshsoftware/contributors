class DatatypeChangedInGitLog < ActiveRecord::Migration
  def self.up
    change_column :git_logs, :committed_at, :datetime, :null => false
  end

  def self.down
    change_column :git_logs, :committed_at, :time, :null => false
  end
end
