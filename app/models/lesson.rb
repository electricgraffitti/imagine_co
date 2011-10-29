# == Schema Information
#
# Table name: lessons
#
#  id                 :integer(4)      not null, primary key
#  lesson_template_id :integer(4)
#  student_id         :integer(4)
#  video_watched      :boolean(1)
#  complete           :boolean(1)
#  score              :text
#  created_at         :datetime
#  updated_at         :datetime
#

class Lesson < ActiveRecord::Base
  
  #Associations
  belongs_to :lesson_template
  belongs_to :student
  has_many :lesson_results
  
  #Scopes
  scope :test_complete, :conditions => {"complete = ?", true}
  
  # Methods
  
  def name
    return self.lesson_template.name
  end
  
  def subject
    return self.lesson_template.subject
  end
  
  def questions
    return self.lesson_template.questions
  end
  
  def template_questions(lesson_template = nil)
    if lesson_template
      return lesson_template.questions.shuffle
    else
      return self.ko_lesson_template.questions.shuffle
    end
  end
  
  def video_url
    return self.lesson_template.videos.last.video.url
  end
  
  def template_name
    return self.lesson_template.name
  end
  
  def test_complete?
    if self.complete == true
      return true
    else
      return false
    end
  end
  
  def amount_correct
    lesson_questions = self.template_questions(self.lesson_template)
    correct_answers = 0
    results = self.lesson_results
    results.each do |r|
      if Question.exists?(r.question_id)
        question = Question.find(r.question_id)
        case question.question_type
      when "Short_Answer"
        correct_answers += question.check_short_answer(r.student_answer)
      when "Essay"
        correct_answers += question.check_essay(r.student_answer)
      else
        correct_answers += question.check_multiple_choice(r.student_answer)
      end
      end
    end
    return "#{correct_answers}/#{lesson_questions.size}"
  end
  
  
  
end
