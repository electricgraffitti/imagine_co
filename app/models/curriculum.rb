# == Schema Information
#
# Table name: curriculums
#
#  id                 :integer(4)      not null, primary key
#  teacher_id         :integer(4)
#  lesson_template_id :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

class Curriculum < ActiveRecord::Base
  
  belongs_to :teacher, :class_name => "Teacher"
  belongs_to :lesson_template, :class_name => "LessonTemplate"
end
