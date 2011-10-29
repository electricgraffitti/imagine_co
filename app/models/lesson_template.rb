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
  has_many :curriculums
  has_many :teachers, :through => :curriculums
  has_many :classroom_lessons
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
  
  def prep_for_vertical
    cap_text = (self.name).upcase
    clean_text = cap_text.delete("-")
    split_caps = clean_text.split(//)
    return split_caps.join(" ")
  end
  
end
