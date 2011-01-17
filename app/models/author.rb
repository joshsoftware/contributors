class Author < ActiveRecord::Base
  attr_accessible :name, :name
  has_many :git_logs, :dependent => :delete_all 
  has_many :repositories, :through => :author_repositories
  has_many :author_repositories, :dependent => :delete_all 
end
