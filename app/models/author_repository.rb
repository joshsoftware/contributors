class AuthorRepository < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository
  
  scope :by_repository, lambda { |repository| { :conditions => ['repository_id = ?', repository] } }
  scope :by_author, lambda { |author| { :conditions => ['author_id = ?', author] } }
end
