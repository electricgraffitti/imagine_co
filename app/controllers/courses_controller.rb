class CoursesController < ApplicationController
  
  before_filter :require_teacher, :except => [:index, :show]
  before_filter :require_student, :only => [:index, :show]
  layout "internal"
  
  def index
    @student = Student.find(params[:student_id])
    @courses = student.courses
  end

  def new
    @course = Course.new
    @classroom_id = params[:classroom_id]
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = Course.find(params[:id])
  end

  def create
    @course = Course.new(params[:course])
    
    respond_to do |format|
      if @course.save
        format.html { redirect_to(classroom_path(:id => @course.classroom_id), :notice => 'Student was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @course = Course.find(params[:id])
  end

  def destroy
    @course = Course.find_student_course(params[:student_id], params[:classroom_id])
    @course.destroy
    
    respond_to do |format|
      format.html { redirect_to(classroom_path(params[:classroom_id]), :notice => "Student removed.") }
    end
  end

end
