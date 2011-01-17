class GitLog < ActiveRecord::Base
  belongs_to :author
  belongs_to :repository
  validates_presence_of :sha, :repository
  after_create :create_author_repository
  def create_author_repository
    AuthorRepository.create(:author_id => author, :repository_id => repository)
  end
end
