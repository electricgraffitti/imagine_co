# == Schema Information
#
# Table name: courses
#
#  id           :integer(4)      not null, primary key
#  classroom_id :integer(4)
#  student_id   :integer(4)
#  created_at   :datetime
#  updated_at   :datetime
#

class Course < ActiveRecord::Base
  
  # Validations
  validates_presence_of :classroom_id, :on => :create, :message => "can't be blank"
  validates_presence_of :student_id, :on => :create, :message => "can't be blank"
  
  belongs_to :classroom
  belongs_to :student
  
  # Scopes
  scope :classrooms, lambda {|id| where(:classroom_id => id)}
  
  def self.find_student_course(student_id, classroom_id)
    where(:student_id => student_id, :classroom_id => classroom_id).first()
  end
  
end
