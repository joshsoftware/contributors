class RepositoriesController < ApplicationController
  # GET /repositories
  # GET /repositories.xml
  def index
    @repository = Repository.all
    @repositories = Repository.all.paginate({:page => params[:page], :per_page => NO_OF_ROWS_PER_PAGE})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @repositories }
    end
  end

  # GET /repositories/1
  # GET /repositories/1.xml
  def show
    @repository = Repository.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @repository }
    end
  end

  # GET /repositories/new
  # GET /repositories/new.xml
  def new
    @repository = Repository.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @repository }
    end
  end

  # GET /repositories/1/edit
  def edit
    @repository = Repository.find(params[:id])
  end

  # POST /repositories
  # POST /repositories.xml
  def create
    @repository = Repository.new(params[:repository])

    respond_to do |format|
      if @repository.save
        format.html { redirect_to(@repository, :notice => 'Repository was successfully created.') }
        format.xml  { render :xml => @repository, :status => :created, :location => @repository }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /repositories/1
  # PUT /repositories/1.xml
  def update
    @repository = Repository.find(params[:id])

    respond_to do |format|
      if @repository.update_attributes(params[:repository])
        format.html { redirect_to(@repository, :notice => 'Repository was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @repository.errors, :status => :unprocessable_entity }
      end
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
    
    to =  params[:to].empty? ? Time.now : params[:to] 
    # params:(OPTIONAL)	:to, :from :author  
 
    @logs = @repository.git_logs.to(to)
    @logs = @logs.by_author(paramsi[:author]) if params[:author]
    @logs = @logs.from(params[:from]) if !params[:from].empty?
    render "git_logs/index" 
  end

  # user defined method th parse, verify the git url and populate the repository

  def populate

    String name = params['repository']['name']
    arr = /^\w*[@|:][\/\/]*github.com[:?\/]*([\w]+)\/([\w\-\.]+).git$/.match(name).captures
    #str = "http://github.com/api/v2/json/commits/list/".concat(arr[0]).concat("/").concat(arr[1]).concat("/master")
    str = "http://github.com/api/v2/json/commits/list/" + arr[0] + "/" + arr[1] + "/master"
    url = URI.parse(str)
    res = Net::HTTP.get_response(url)
    if res.class == Net::HTTPOK

      @repository = Repository.new
      @author_repository = AuthorRepository.new
      @repository.name = arr[0] + "/" +arr[1]
      @repository.url = name
      @repository.user = current_user
      @repository.save

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
        @git_log.repository = @author_repository.repository = @repository

        @git_log.save
        @author_repository.save
      end
    end
  end

end

