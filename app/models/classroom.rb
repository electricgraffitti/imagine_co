# == Schema Information
#
# Table name: classrooms
#
#  id         :integer(4)      not null, primary key
#  teacher_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class Classroom < ActiveRecord::Base
  
  # Associations
  belongs_to :teacher, :class_name => "Teacher", :foreign_key => "teacher_id"
  has_many :courses
  has_many :students, :through => :courses
  
  
  # Methods
  
  def student_count
    return self.students.size
  end
  
  def students
    course_students = Array.new
    self.courses.each do |course|
      course_students.push(course.student)
    end
    return course_students
  end
  
end
