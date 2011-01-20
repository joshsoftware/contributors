class AuthorRepository < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository
  
# validates_uniqueness_of :author, :scope => :repository, :message => 'Author_id and respository_id already exist in author_repository table.'
end
