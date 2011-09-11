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
  
  #Scopes
  scope :test_complete, :conditions => {"complete = ?", true}
  
end
