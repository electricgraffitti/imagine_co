# == Schema Information
#
# Table name: lesson_results
#
#  id             :integer(4)      not null, primary key
#  lesson_id      :integer(4)
#  question_id    :integer(4)
#  student_answer :text
#  answer_state   :text
#  created_at     :datetime
#  updated_at     :datetime
#

class LessonResult < ActiveRecord::Base
  
  # Validations
  belongs_to :lesson, :class_name => "Lesson", :foreign_key => "lesson_id"
  belongs_to :question, :class_name => "Question", :foreign_key => "question_id"
  
  validates_presence_of :student_answer, :on => :create, :message => "can't be blank"
  
  # Methods
  
  def self.file_answers(params, lesson)
    params.each do |question_id, test_answer|
      if question_id.to_i > 0
        q = Question.find(question_id)
        case q.question_type
        when "Short_Answer"
          self.create(:lesson_id => lesson.id, :question_id => q.id, :student_answer => test_answer["student_answer"])
        when "Essay"                           
          self.create(:lesson_id => lesson.id, :question_id => q.id, :student_answer => test_answer )
        else                                   
          self.create(:lesson_id => lesson.id, :question_id => q.id, :student_answer => test_answer )
        end
      end
    end   
  end
  
  def self.specific_result(lid, qid)
    result = find(:all, :conditions => ["lesson_id = ? && question_id = ?", lid, qid]).first()
    return result.student_answer
    
  end
  
end
