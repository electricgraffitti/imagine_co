# == Schema Information
#
# Table name: answers
#
#  id          :integer(4)      not null, primary key
#  question_id :integer(4)
#  answer      :string(255)
#  correct     :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Answer < ActiveRecord::Base
  
  #Associations
  belongs_to :question
  
end
