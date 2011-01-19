class GitLogsController < ApplicationController
  # GET /git_logs
  # GET /git_logs.xml
  before_filter :init

  def init
    @selected = 'logs'
  end
  
  def index
 #   @git_logs = GitLog.all
    @repositories = Repository.all
    @authors = Author.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @git_logs }
    end
  end

  # GET /git_logs/1
  # GET /git_logs/1.xml
  def show
    @git_log = GitLog.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @git_log }
    end
  end

  # GET /git_logs/new
  # GET /git_logs/new.xml
  def new
    @git_log = GitLog.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @git_log }
    end
  end

  # GET /git_logs/1/edit
  def edit
    @git_log = GitLog.find(params[:id])
  end

  # POST /git_logs
  # POST /git_logs.xml
  def create
    @git_log = GitLog.new(params[:git_log])

    respond_to do |format|
      if @git_log.save
        format.html { redirect_to(@git_log, :notice => 'Git log was successfully created.') }
        format.xml  { render :xml => @git_log, :status => :created, :location => @git_log }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @git_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /git_logs/1
  # PUT /git_logs/1.xml
  def update
    @git_log = GitLog.find(params[:id])

    respond_to do |format|
      if @git_log.update_attributes(params[:git_log])
        format.html { redirect_to(@git_log, :notice => 'Git log was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @git_log.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /git_logs/1
  # DELETE /git_logs/1.xml
  def destroy
    @git_log = GitLog.find(params[:id])
    @git_log.destroy

    respond_to do |format|
      format.html { redirect_to(git_logs_url) }
      format.xml  { head :ok }
    end
  end
end
