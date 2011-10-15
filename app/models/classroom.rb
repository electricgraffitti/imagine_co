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
  
  def to_params
    return "#{self.id}-#{self.name}"
  end
  
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
  
  def assign_lesson_to_students(lesson_template_id)
    self.students.each do |student|
      check_existing = student.check_for_lesson(lesson_template_id)
      if check_existing == true
        Lesson.create(:student_id => student.id, :lesson_template_id => lesson_template_id)
        AppMailer.new_lesson_notification(student.id).deliver
      end
    end
  end
  
end
