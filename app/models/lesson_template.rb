# == Schema Information
#
# Table name: lesson_templates
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  questions_count :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#

class LessonTemplate < ActiveRecord::Base
  
  has_many :lessons
  has_many :questions
  
end
