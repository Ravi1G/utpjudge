class ProblemsController < ApplicationController
  before_filter :req_psetter
  before_filter :init_vars

  def init_vars
    @user = current_user
  end

  # GET /problems
  # GET /problems.json
  def index
    @problems = Problem.paginate(:page => params[:page], :per_page => 10).order('created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @problems }
    end
  end

  # GET /problems/1
  # GET /problems/1.json
  def show
    @problem = Problem.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @problem }
    end
  end

  # GET /problems/new
  # GET /problems/new.json
  def new
    @problem = Problem.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @problem }
    end
  end

  # GET /problems/1/edit
  def edit
    @problem = Problem.find(params[:id])
  end

  # POST /problems
  # POST /problems.json
  def create
    @problem = Problem.new(params[:problem])
    puts "\n\n\n\n\n ***********" +  @problem.chlang + "\n\n\n\n\n ***********"
    respond_to do |format|
      if @problem.save
        flash[:class] = "alert alert-success"
        format.html { redirect_to @problem, :notice => 'Problem was successfully created.' }
        format.json { render :json => @problem, :status => :created, :location => @problem }
      else
        format.html { render :action => "new" }
        format.json { render :json => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /problems/1
  # PUT /problems/1.json
  def update
    @problem = Problem.find(params[:id])

    respond_to do |format|
      if @problem.update_attributes(params[:problem])
        flash[:class] = "alert alert-success"
        format.html { redirect_to @problem, :notice => 'Problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @problem.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /problems/1
  # DELETE /problems/1.json
  def destroy
    @problem = Problem.find(params[:id])
    @problem.destroy

    respond_to do |format|
      format.html { redirect_to problems_url }
      format.json { head :no_content }
    end
  end
end
