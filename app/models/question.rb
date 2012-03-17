# == Schema Information
#
# Table name: questions
#
#  id                        :integer(4)      not null, primary key
#  question                  :string(255)
#  question_type             :string(255)
#  score                     :integer(4)
#  order                     :integer(4)
#  lesson_template_id        :integer(4)
#  created_at                :datetime
#  updated_at                :datetime
#  question_pic_file_name    :string(255)
#  question_pic_content_type :string(255)
#  question_pic_file_size    :integer(4)
#  question_pic_updated_at   :datetime
#

class Question < ActiveRecord::Base
  
  # Validations
  # validates_presence_of :question, :on => :create, :message => "can't be blank"
  
  #Assoctiations
  belongs_to :lesson_template, :counter_cache => true
  
  has_many :lesson_results
  
  has_many :answers
  accepts_nested_attributes_for :answers, :allow_destroy => true, :reject_if => lambda { |obj| obj[:answer].blank? }
  
  has_many :pictures, :as => :attachable
  accepts_nested_attributes_for :pictures, :allow_destroy => true, :reject_if => lambda { |obj| obj.blank? }
  
  has_attached_file :question_pic,
    :styles => { :regular => "275x275#", :avatar => "180x142#", :medium => "100x100#", :thumb => "75x75#", :micro => "50x50#" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/question_pictures/:id/:style_:basename.:extension"
  
  
  # Methods
  
  def student_result(lessonid)
    @lesson_result = LessonResult.specific_result(lessonid, self.id)
    if @lesson_result
      return @lesson_result
    else
      return "No Result"
    end
  end
  
  def self.score_answers(params)
    score = 0
    
    params.each do |k,v|
        if k.to_i > 0
        q = self.find(k)
        case q.question_type
        when "Short_Answer"
          score += valuate_short_answer(q,v)
        when "Essay"
          score += valuate_essay(q,v)
        else
          score += valuate_multiple_choice(q,v)
        end
      end
    end
    return score
  end
  
  def check_for_correct_answer(test_result_answer)
      case self.question_type
      when "Essay"
        if test_result_answer == "No Result"
          return "incorrect"
        else
          return "correct"
        end
      when "Short_Answer"
        self.answers.each do |a|
          if (a.answer).to_f == (test_result_answer).to_f
            return "correct"
          else
            return "incorrect"
          end
        end
      else
        self.answers.each do |a|
          if a.id == (test_result_answer).to_i && a.correct?
            return "correct"
          end
        end
        return "incorrect"
      end

  end
  
  def check_short_answer(test_result_answer)
    self.answers.each do |a|
      if (a.answer).to_f == (test_result_answer).to_f
        return 1
      else
        return 0
      end
    end
  end
  
  def check_essay(test_result_answer)
    if test_result_answer == "No Result"
      return 0
    else
      return 1
    end
  end
  
  def check_multiple_choice(test_result_answer)
    self.answers.each do |a|
      if a.id == (test_result_answer).to_i
        if a.correct?
          return 1
        else
          return 0
        end
      end
    end
  end
  
  private
  
  def self.valuate_multiple_choice(q,v)
    a = Answer.find(v)
    if a.correct?
      q.score
    else
      0
    end
  end
  
  def self.valuate_short_answer(q,v)
    
    a = Answer.find(v['answer_id'])

    if v['student_answer']).to_f
      if (a.answer).to_f == (v['student_answer']).to_f
        q.score
      else
        0
      end
    else
      0
    end
    
  end
  
  def self.valuate_essay(q,v)
    q.score
  end
  
  
end
