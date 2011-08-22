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
  belongs_to :lesson_template, :counter_cache => true
  
  has_many :answers
  
  has_many :pictures, :as => :attachable
  accepts_nested_attributes_for :pictures, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
end
