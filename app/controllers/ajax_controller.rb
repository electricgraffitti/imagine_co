class AjaxController < ApplicationController
  
  def assign_curriculum
    Curriculum.ajax_create(params[:lesson_template_id])
  end
  
  def view_questions
    @lesson = LessonTemplate.find(params[:lesson_template_id])
  end
  
end
