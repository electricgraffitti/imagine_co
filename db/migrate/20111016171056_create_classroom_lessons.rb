class CreateClassroomLessons < ActiveRecord::Migration
  def self.up
    create_table :classroom_lessons do |t|
      t.integer :classroom_id
      t.integer :lesson_template_id

      t.timestamps
    end
  end

  def self.down
    drop_table :classroom_lessons
  end
end
