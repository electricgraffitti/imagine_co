# == Schema Information
#
# Table name: students
#
#  id                  :integer(4)      not null, primary key
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  student_key         :string(255)
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
#

class Student < ActiveRecord::Base
  
  #Associations
  belongs_to :account
  has_many :lessons
  has_many :lesson_templates, :through => :lessons
  has_many :courses
  has_many :classrooms, :through => :courses
  has_many :teachers, :through => :classrooms
  
  validates_presence_of :first_name, :on => :create, :message => "can't be blank"
  validates_presence_of :last_name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :email, :on => :create, :message => "must be unique"
  
  #Authlogic
  acts_as_authentic do |c|
    c.login_field = :email
    c.logged_in_timeout = 120.minutes
  end
  
  def full_name
    fullname = (self.first_name + " " + self.last_name).titleize
    return fullname
  end
  
  def check_for_lesson(lesson_template_id)
    self.lessons.each do |lesson|
      if lesson.lesson_template_id == (lesson_template_id).to_i
        return false
      end
    end
    return true
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
  
  def assign_current_classroom_lessons(classroom_id)
    @classroom = Classroom.find(classroom_id)
    @classroom.classroom_lessons.each do |lesson|
      if self.check_for_lesson(lesson.lesson_template_id)
        Lesson.create(:student_id => self.id, :lesson_template_id => lesson.lesson_template_id)
      end
    end
  end
    
  def self.check_for_existing(params)

    if self.exists?(:email => params[:email])
      return where(:email => params[:email]).first
    else
      @new_student = Student.new(params)
      @new_student.set_passwords
      @new_student.save_without_session_maintenance
      AppMailer.registration_email(@new_student).deliver
      return @new_student
    end
    
  end
  
  def set_passwords
    if self.student_key.blank?
      self.student_key = dictionary_password
      self.password = self.student_key
      self.password_confirmation = self.password
    end
  end
  
  private
  
  def dictionary_password
    passwds = Array.new
    File.open("#{RAILS_ROOT}/config/passwords.txt", "r").each { |f| passwds << f.gsub("\n", "") }
    return passwds[rand(passwds.length)] 
  end 
  
end
