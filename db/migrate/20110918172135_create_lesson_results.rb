class CreateLessonResults < ActiveRecord::Migration
  def self.up
    create_table :lesson_results do |t|
      t.integer :lesson_id
      t.integer :question_id
      t.text :student_answer
      t.text :answer_state

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_results
  end
end
