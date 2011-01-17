class CreateGitLogs < ActiveRecord::Migration
  def self.up
    create_table :git_logs do |t|
      t.string :sha
      t.string :comment
      t.references :author
      t.references :repository
      t.time :committed_at

      t.timestamps
    end
  end

  def self.down
    drop_table :git_logs
  end
end
