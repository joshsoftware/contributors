class AuthorRepositoriesController < ApplicationController
#  before_filter :authenticate_user!, :only => [:new, :create, :edit, :update, :destroy]
#  before_filter :is_owner, :only => [:edit, :update, :destroy]
  # GET /author_repositories
  # GET /author_repositories.xml

  before_filter :init
  def init
    @selected = 'authors'
  end
  
  def index
    @author_repositories = AuthorRepository.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @author_repositories }
    end
  end

  # GET /author_repositories/1
  # GET /author_repositories/1.xml
  def show
    @author_repository = AuthorRepository.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @author_repository }
    end
  end

  # GET /author_repositories/new
  # GET /author_repositories/new.xml
  def new
    @author_repository = AuthorRepository.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @author_repository }
    end
  end

  # GET /author_repositories/1/edit
  def edit
    @author_repository = AuthorRepository.find(params[:id])
  end

  # POST /author_repositories
  # POST /author_repositories.xml
  def create
    @author_repository = AuthorRepository.new(params[:author_repository])

    respond_to do |format|
      if @author_repository.save
        format.html { redirect_to(@author_repository, :notice => 'Author repository was successfully created.') }
        format.xml  { render :xml => @author_repository, :status => :created, :location => @author_repository }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @author_repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /author_repositories/1
  # PUT /author_repositories/1.xml
  def update
    @author_repository = AuthorRepository.find(params[:id])

    respond_to do |format|
      if @author_repository.update_attributes(params[:author_repository])
        format.html { redirect_to(@author_repository, :notice => 'Author repository was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @author_repository.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /author_repositories/1
  # DELETE /author_repositories/1.xml
  def destroy
    @author_repository = AuthorRepository.find(params[:id])
    @author_repository.destroy

    respond_to do |format|
      format.html { redirect_to(author_repositories_url) }
      format.xml  { head :ok }
    end
  end
end
