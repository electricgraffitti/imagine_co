class ClassroomsController < ApplicationController
  
  before_filter :require_teacher
  layout 'internal'
  
  def index
    @classrooms = current_teacher.classrooms
  end
  
  def new
    @classroom = Classroom.new
  end
  
  def show
    @classroom = Classroom.find(params[:id])
  end
  
  def create
    @classroom = Classroom.new(params[:classroom])
    @classroom.teacher_id = current_teacher.id
    respond_to do |format|
      if @classroom.save
        format.html { redirect_to(classrooms_path, :notice => 'Classroom was successfully added.') }
      else
        format.html { render :action => "new" }
      end
    end
  end
  
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy

    respond_to do |format|
      format.html { redirect_to(classrooms_path, :notice => "Classroom deleted.") }
      format.xml  { head :ok }
    end
  end
end
