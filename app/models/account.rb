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
  accepts_nested_attributes_for :teachers, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  has_many :students
  accepts_nested_attributes_for :teachers, :allow_destroy => true, :reject_if => proc { |obj| obj.blank? }
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  
end
