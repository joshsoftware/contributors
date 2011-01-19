class RepositoriesController < ApplicationController
  # GET /repositories
  # GET /repositories.xml
  before_filter :init
  def init
    @selected = 'repository'
  end
  def index
    @repository = Repository.all
    @repositories = Repository.all.paginate({:page => params[:page], :per_page => NO_OF_ROWS_PER_PAGE})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repositories }
    end
  end

  # GET /repositories/new
  # GET /repositories/new.xml
  def new
    @repository = Repository.new
    @selected = 'repo_new'
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repository }
    end
  end

  # DELETE /repositories/1
  # DELETE /repositories/1.xml
  def destroy
    @repository = Repository.find(params[:id])
    @repository.destroy

    respond_to do |format|
      format.html { redirect_to(repositories_url) }
      format.xml  { head :ok }
    end
  end


  #generate timesheet , scopes are defined in models/git_log.rb
  def create_timesheet
    # get repository (mandatory): params[:repository]
    @repository = Repository.find(params[:repository])
    @author_list = Author.all  
    
    to =  params[:to].blank? ? Time.now : params[:to] 
    # params:(OPTIONAL)	:to, :from :author  
 
    @logs = @repository.git_logs.to(to)
    @logs = @logs.by_author(paramsi[:author]) if params[:author].blank?
    @logs = @logs.from(params[:from]) if !params[:from].blank?
    render "git_logs/index" 
  end


  # user defined method th parse, verify the git url and populate the repository
  def create
    @repo = Repository.new(params['repository'])
    repo_name = /^\w*[@|:][\/\/]*github.com[:?\/]*(([\w]+)\/([\w\-\.]+)).git$/.match(params['repository']['url']).captures
    @repo.name = repo_name.first if @repo.name.blank?
    str = "http://github.com/api/v2/json/commits/list/" + repo_name.first  + "/master"
    url = URI.parse(str)
    res = Net::HTTP.get_response(url)
    if res.class == Net::HTTPOK
      #@repository.save
      @repo.user = current_user
      @repo.save
      @author_repository = AuthorRepository.new
      commits = MultiJson.decode(res.body)
      commits['commits'].each do |commit|
        @git_log = GitLog.new
        @git_log.sha = commit['id']
        @git_log.comment = commit['message']
        @git_log.committed_at = commit['committed_date']
        @author = Author.find_by_name(commit['author']['name']) 
        if @author == nil 
          @author = Author.new
          @author.name = commit['author']['name']
          @author.email = commit['author']['email']
          @author.save
        end
        @git_log.author = @author_repository.author = @author
        @git_log.repository = @author_repository.repository = @repo
        @git_log.save
        @author_repository.save
      end
      flash[:notice] = "Successfully Created"
    elsif res.class == Net::HTTPNotFound
      flash[:notice] = "Repository Invalid"
    end
    redirect_to :action => "index"
  end
end
