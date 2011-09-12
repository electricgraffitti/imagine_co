class AccountsController < ApplicationController
  
  before_filter :require_admin, :only => [:index, :destroy]
  before_filter :require_teacher, :only => [:edit, :update, :show]
  
  def index
    @accounts = Account.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @accounts }
    end
  end

  def show
    @account = current_teacher.account

    respond_to do |format|
      format.html { render :layout => "internal"}
      format.xml  { render :xml => @account }
    end
  end

  def new
    @account = Account.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @account }
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def create
    @account = Account.new(params[:account])
    
    respond_to do |format|
      if @account.save
        teacher = @account.teachers.last
        TeacherSession.create(:login => teacher.username, :password => teacher.crypted_password)
        format.html { redirect_to teacher_dashboard_path, :notice => 'Account was successfully created.' }
        format.xml  { render :xml => @account, :status => :created, :location => @account }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @account = Account.find(params[:id])

    respond_to do |format|
      if @account.update_attributes(params[:account])
        format.html { redirect_to(@account, :notice => 'Account was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @account.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy

    respond_to do |format|
      format.html { redirect_to(accounts_url) }
      format.xml  { head :ok }
    end
  end

end
