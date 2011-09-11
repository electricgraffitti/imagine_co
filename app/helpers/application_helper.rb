module ApplicationHelper
  
  def current_user_account_name
    return current_teacher.account.name if current_teacher
    return current_student.account.name if current_student
  end
  
end
