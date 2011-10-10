module ApplicationHelper
  
  def current_user_account_name
    return "Account: " + current_teacher.account.name if current_teacher
    return "Classroom Burro" if current_student
  end
  
  def answer_state(a)
    if a.correct?
      return "correct_answer"
    end
  end
  
  def essay_result(q, lid)
    q.student_result(@lesson.id)
  end
  
  def essay_result_class(q, lid)
    result = q.student_result(@lesson.id)
    if result == "No Result"
      return "incorrect"
    else
      return "essay"
    end
  end
  
end
