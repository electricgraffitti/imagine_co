# == Schema Information
#
# Table name: answers
#
#  id          :integer(4)      not null, primary key
#  question_id :integer(4)
#  answer      :string(255)
#  correct     :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  
  #Associations
  belongs_to :question, :class_name => "Question", :foreign_key => "question_id"
  
  def check_answer_state(question, student_answer)
    case question.question_type
    when "Short_Answer"
      answer_state = check_short_answer(student_answer)
    when "Essay"
      answer_state = check_essay_answer(student_answer)
    else
      answer_state = check_multiple_choice_answer(student_answer)
    end
    return answer_state
  end
  
  def valuate_multiple_choice(q,v)
    a = KoAnswer.find(v)
    if a.correct?
      q.score ? q.score : 0
    else
      0
    end
  end
  
  def valuate_short_answer(q,v)
    
    a = KoAnswer.find(v['answer_id'])
    if (a.answer).to_f == (v['student_answer']).to_f
      q.score ? q.score : 0
    else
      0
    end
    
  end
  
  def valuate_essay(q,v)
    q.score ? q.score : 0
  end
  
  def check_short_answer(student_answer)
    if (self.answer).to_f == (student_answer).to_f
      return ""
    else
      return "incorrect"
    end
  end
  
  def check_essay_answer(student_answer)
    return "essay"
  end
  
  def check_multiple_choice_answer(student_answer)
    if self.id == (student_answer).to_i && self.correct == false
      return "incorrect"
    else
      return ""
    end
  end
  
  def correct?
    self.correct ? true : false
  end
  
end
