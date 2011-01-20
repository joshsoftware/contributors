class RepositoriesController < ApplicationController
  # GET /repositories
  # GET /repositories.xml

  before_filter :init
  def init
    @selected = 'repositories'
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
    to = params[:to] || Time.now

    @author_list = Author.all  
    # params:(OPTIONAL)	:to, :from :author  
    @logs = @repository.git_logs.to(to)
    @logs = @logs.by_author(params[:author]) if params[:author]
    @logs = @logs.from(params[:from]) if params[:form]
  end


  # user defined method th parse, verify the git url and populate the repository
=begin
def create
    # if git url is not present in db, create new repo and assign current user as owner
    if (@repo = Repository.find_by_url(params['repository']['url'])) == nil
      @repo = Repository.new(params['repository'])
      @repo.user = current_user
    else  #else if old git url, load it. 
      flash[:notice] = "Repository Present"
      #    @repo = Repository.find_by_url(params['repository']['url'])
    end

    #if url does not match given structure, flash notice and redirect to index
    if /^\w*[@|:][\/\/]*github.com[:?\/]*(([\w]+)\/([\w\-\.]+)).git$/.match(params['repository']['url']) == nil
      flash[:notice] = "Repository Link Invalid"
      redirect_to :action => "index"
    else # if matches the structure then extract the author name and project name in repo_name
      repo_name = /^\w*[@|:][\/\/]*github.com[:?\/]*(([\w]+)\/([\w\-\.]+)).git$/.match(params['repository']['url']).match.captures
    end

    if repo_name.first.blank? # if repo_name.first is blank, flash error and redirect to index
      flash[:notice] = "GitLog Url Cannot Be Blank"
      redirect_to :action => "index"
    end

    @repo.name = repo_name.first
    str = "http://github.com/api/v2/json/commits/list/" + repo_name.first  + "/master"
    url = URI.parse(str)
    res = Net::HTTP.get_response(url)
    if res.class == Net::HTTPOK #the json url is valid if response is OK
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
        @author_repository.save
        @git_log.save
      end
      flash[:notice] = "Successfully Created"
    elsif res.class == Net::HTTPNotFound
      flash[:notice] = "Repository Invalid"
    end
    redirect_to :action => "index"
=end

  def create
    #if url passed is not blank and matches the structure then   
    if !params['repository']['url'].blank? and  /^\w*[@|:][\/\/]*github.com[:?\/]*(([\w]+)\/([\w\-\.]+)).git$/.match(params['repository']['url'])
      repo_name = /^\w*[@|:][\/\/]*github.com[:?\/]*(([\w]+)\/([\w\-\.]+)).git$/.match(params['repository']['url']).captures.first
      str = "http://github.com/api/v2/json/commits/list/" + repo_name + "/master"
      url = URI.parse(str)
      res = Net::HTTP.get_response(url)
      #if url not found
      if res.class == Net::HTTPNotFound
        flash[:notice] = "Invalid Url"
        redirect_to :action => "index"
        return
      elsif res.class == Net::HTTPOK #url found 
        #if found in database 
        if (@repo = Repository.find_by_url(params['repository']['url'])) != nil
          flash[:notice] = "present in database"
          redirect_to :action => "index"
          return

        else
          @repo = Repository.new(params['repository'])
          @repo.name = repo_name
          @repo.user = current_user 
          @repo.save
          commits = MultiJson.decode(res.body)
          commits['commits'].each do |commit|
            @author_repository = AuthorRepository.new
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
            @author_repository.save
            @git_log.save
          end#do
        end#inner if
      end#elsif
    end#if
    redirect_to :action => "index"
  end#def
end#class
