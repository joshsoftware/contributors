class AuthorRepository < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository
end
