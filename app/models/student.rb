# == Schema Information
#
# Table name: students
#
#  id                  :integer(4)      not null, primary key
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  username            :string(255)
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  login_count         :integer(4)
#  failed_login_count  :integer(4)
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  account_id          :integer(4)
#

class Student < ActiveRecord::Base
  
  #Associations
  belongs_to :account
  has_many :lessons
  has_many :lesson_templates, :through => :lessons
  has_many :courses
  has_many :classrooms, :through => :courses
  has_many :teachers, :through => :classrooms
  
  validates_uniqueness_of :email, :on => :create, :message => "must be unique"
  
  
  #Authlogic
  acts_as_authentic do |c|
    c.login_field = :email
    c.logged_in_timeout = 120.minutes
  end
  
  def full_name
    fullname = self.first_name + " " + self.last_name
    return fullname
  end
  
  def teacher_lessons(teacher)
    lessons = []
    teacher.lesson_templates.each do |lt|
      self.lessons.each do |l|
        if l.lesson_template_id == lt.id
          lessons.push(l)
        end
      end
    end
    return lessons
  end
  
  def teacher_classrooms(teacher)
    classrooms = []
    teacher.classrooms.each do |cr|
      if self.classrooms.include?(cr)
        classrooms.push(cr)
      end
    end
    return courses
  end
  
  def classroom_lessons(classroom)
    courses = []
    self.courses.each do |c|
      if c.classroom_id == classroom.id
        courses.push(c)
      end
    end
  end
  
end
