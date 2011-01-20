class AuthorsController < ApplicationController
  # GET /authors
  # GET /authors.xml
  before_filter :init

  def init
    @selected = 'authors'
  end
  
  def index
    @authors = Author.all
    @authors = Author.all.paginate({:page => params[:page], :per_page => NO_OF_ROWS_PER_PAGE})
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @authors }
    end
  end

# user need not display author specific data
=begin
  # GET /authors/1
  # GET /authors/1.xml
  def show
    @author = Author.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @author }
    end
  end
=end
# user cannot create author 

  # GET /authors/new
  # GET /authors/new.xml
  # redirected to index
  def new
    #@author = Author.new
    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.xml  { render :xml => @author }
    #end
    redirect_to :action => "index"
  end

=begin

#do not need to edit author
  # GET /authors/1/edit
  def edit
    @author = Author.find(params[:id])
  end
=end
  # POST /authors
  # POST /authors.xml
  def create
    @author = Author.new(params[:author])

    respond_to do |format|
      if @author.save
        format.html { redirect_to(@author, :notice => 'Author was successfully created.') }
        format.xml  { render :xml => @author, :status => :created, :location => @author }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /authors/1
  # PUT /authors/1.xml
  def update
    @author = Author.find(params[:id])

    respond_to do |format|
      if @author.update_attributes(params[:author])
        format.html { redirect_to(@author, :notice => 'Author was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @author.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /authors/1
  # DELETE /authors/1.xml
  def destroy
    @author = Author.find(params[:id])
    @author.destroy

    respond_to do |format|
      format.html { redirect_to(authors_url) }
      format.xml  { head :ok }
    end
  end
 
 #generate timesheet, scopes are defined in models/git_hub.rb 
 def create_timesheet
   #mandatory parameter params[:author]
   @author = Author.find(params[:author]) 
   to =  params[:to].blank? ? Time.now.strftime("%Y-%d-%m %k:%M:%S") : params[:to]     
   @repositories = @author.repositories

   #optional paramaeters :from, :to, :repository
   @logs = GitLog.to(to).by_author(@author)

   @logs = @logs.by_repository(params[:repository]) if !params[:repository].blank?
   
   if !params[:from].blank?
     fromdate = params[:from].to_datetime.strftime("%Y-%m-%d %H:%M:%S")
     @logs = @logs.fromdate(fromdate)
   end  
   
   render "git_logs/index"
 end

end


















