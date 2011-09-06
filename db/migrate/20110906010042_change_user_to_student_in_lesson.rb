class ChangeUserToStudentInLesson < ActiveRecord::Migration
  def self.up
    
    rename_column :lessons, :user_id, :student_id
    
  end

  def self.down
    
    rename_column :lessons, :student_id, :user_id
    
  end
end
