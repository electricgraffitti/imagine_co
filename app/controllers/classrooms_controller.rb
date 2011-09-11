class ClassroomsController < ApplicationController
  
  before_filter :require_teacher
  layout 'internal'
  
  def index
    @students = current_teacher.students
  end
  
  def new
    @classroom = Classroom.new
  end
  
  def show
    @students = current_teacher.students
  end
  
  def create
    @classroom = Classroom.new(params[:classroom])
    @classroom.teacher_id = current_teacher.id
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to(classroom_path, :notice => 'Student was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def destroy
  end
end
