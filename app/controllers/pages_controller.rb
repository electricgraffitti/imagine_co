class PagesController < ApplicationController
  
  
  def index
    @account = Account.new
    @account.teachers.build
    if current_teacher.present?
      redirect_to classrooms_path
    end
    
    if current_student.present?
      redirect_to student_dashboard_path
    end
  end
  
  # def about
  #   
  # end

end
