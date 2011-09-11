# == Schema Information
#
# Table name: lesson_templates
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  questions_count :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  public          :boolean(1)
#  private         :boolean(1)
#

class LessonTemplate < ActiveRecord::Base
  
  # Associations
  has_many :lessons
  has_many :videos, :as => :viewable
  accepts_nested_attributes_for :videos, :allow_destroy => true, :reject_if => lambda { |obj| obj[:video].blank? }
  
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |obj| obj[:question].blank? }
  
  
  # Scopes
  scope :public_template, where("public = ?", true)
  scope :private_template, where("private = ?", true)
  
  
end
