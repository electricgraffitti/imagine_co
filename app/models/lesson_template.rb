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
#  teacher_id      :integer(4)
#  account_id      :integer(4)
#  subject         :text
#

class LessonTemplate < ActiveRecord::Base
  
  # Associations
  has_many :lessons
  has_many :curriculums, :class_name => "curriculum"
  has_many :lesson_templates, :class_name => "lesson_template", :through => :curriculums
  has_many :videos, :as => :viewable
  accepts_nested_attributes_for :videos, :allow_destroy => true, :reject_if => lambda { |obj| obj[:video].blank? }
  
  has_many :questions, :dependent => :destroy
  accepts_nested_attributes_for :questions, :allow_destroy => true, :reject_if => lambda { |obj| obj[:question].blank? }
  
  
  # Scopes
  scope :public_templates, where("public = ?", true)
  scope :account_templates, lambda {|aid| where("account_id = ? && private = ? && public = ?", aid, false, false)}
  scope :private_templates, lambda {|id| where("teacher_id =? && private = ?", id, true)}
  
  # Methods
  
  def in_curriculum(teacher)
    cid = []
    teacher.curriculums.each do |c|
      cid.push(c.lesson_template_id)
    end
    cid.include?(self.id)
  end
  
  def self.filtered(id)
    self.find(:all, :conditions => ["id != ?", id])
  end
  
  
end
