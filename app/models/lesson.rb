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
  
  
  
end
