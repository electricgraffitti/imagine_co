# == Schema Information
#
# Table name: accounts
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Account < ActiveRecord::Base
  
  has_many :teachers
  has_many :students
  
end
