# == Schema Information
#
# Table name: classroom_lessons
#
#  id                 :integer(4)      not null, primary key
#  classroom_id       :integer(4)
#  lesson_template_id :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

class ClassroomLesson < ActiveRecord::Base
  
  belongs_to :classroom, :class_name => "Classroom", :foreign_key => "classroom_id"
  belongs_to :lesson_template, :class_name => "LessonTemplate", :foreign_key => "lesson_template_id"
  
end
