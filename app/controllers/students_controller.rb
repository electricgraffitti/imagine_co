class StudentsController < ApplicationController
  
  before_filter :require_teacher, :except => [:show]
  before_filter :require_auth, :only => [:show]
  layout "internal"
  
  # GET /students
  # GET /students.xml
  def index
    @students = current_teacher.students

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    if current_teacher
      @student = Student.find(params[:id])
      @lessons = @student.teacher_lessons(current_teacher)
    else
      @student = current_student
    end
    
    if params[:classroom_id]
      @classroom = Classroom.find(params[:classroom_id])
    end
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new
    @classroom_id = params[:classroom_id]
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.check_for_existing(params[:student])
    
    respond_to do |format|
      if @student
        Course.create(:student_id => @student.id, :classroom_id => params[:classroom_id])
        AppMailer.new_classroom_notification(@student).deliver
        format.html { redirect_to(classroom_path(params[:classroom_id]), :notice => 'Student was successfully added.') }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update
    @student = Student.find(params[:id])

    respond_to do |format|
      if @student.update_attributes(params[:student])
        format.html { redirect_to(@student, :notice => 'Student was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_url) }
      format.xml  { head :ok }
    end
  end
  
end
