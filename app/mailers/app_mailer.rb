class AppMailer < ActionMailer::Base
  default :from => "support@kosjourney.com"
  
  def registration_email(student)
    mail(:to => "#{student.full_name} <#{student.email}>", :subject => "New Classroom Burro Account")
  end
  
  def new_classroom_notification(student)
    mail(:to => "#{student.full_name} <#{student.email}>", :subject => "You have been added to a new Classroom Burro classroom.")
  end
  
  def new_lesson_notification(lesson_params)
    @student = Student.find(lesson_params[:student_id])
    mail(:to => "#{@student.full_name} <#{@student.email}>", :subject => "You have been assigned a new Classroom Burro lesson.")
  end
  
end
