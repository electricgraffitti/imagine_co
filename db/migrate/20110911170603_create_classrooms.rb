class CreateClassrooms < ActiveRecord::Migration
  def self.up
    create_table :classrooms do |t|
      t.integer :teacher_id
      t.integer :student_id

      t.timestamps
    end
  end

  def self.down
    drop_table :classrooms
  end
end
