# == Schema Information
#
# Table name: classrooms
#
#  id         :integer(4)      not null, primary key
#  teacher_id :integer(4)
#  student_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#

class Classroom < ActiveRecord::Base
  
  # Associations
  belongs_to :teacher, :class_name => "Teacher", :foreign_key => "teacher_id"
  belongs_to :student, :class_name => "Student", :foreign_key => "student_id"
  
end
