class LessonResultsController < ApplicationController
  
  layout 'internal'
  
  def index
    @lesson = Lesson.find(params[:lesson_id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def show
    @lesson = Lesson.find(params[:id])
    
    respond_to do |format|
      format.html
      format.js
    end
  end

end
