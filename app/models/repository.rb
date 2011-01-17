class Repository < ActiveRecord::Base
  has_many :git_logs
  has_many :authors, :through => :author_repositories
  has_many :author_repositories
  validates_presence_of :name 
  validates_presence_of :url
end
