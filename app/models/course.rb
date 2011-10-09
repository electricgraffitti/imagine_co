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
  
  belongs_to :classroom
  belongs_to :student
  
end
