# == Schema Information
#
# Table name: questions
#
#  id                 :integer(4)      not null, primary key
#  question           :string(255)
#  question_type      :string(255)
#  score              :integer(4)
#  order              :integer(4)
#  lesson_template_id :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

class Question < ActiveRecord::Base
  
  #Assoctiations
  has_many :answers
  belongs_to :lesson_template, :counter_cache => true
end
