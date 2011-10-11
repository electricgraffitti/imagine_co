class RemoveStudentIdFromClassrooms < ActiveRecord::Migration
  def self.up
    remove_column :classrooms, :student_id
  end

  def self.down
    add_column :classrooms, :student_id, :integer
  end
end
