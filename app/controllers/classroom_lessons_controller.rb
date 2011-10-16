class ClassroomLessonsController < ApplicationController
  
  before_filter :require_teacher
  
  layout 'internal'
  
  def show
    @classroom = Classroom.find(params[:id])
    
    respond_to do |format|
      format.html # show.html.erb
    end
  end

end
