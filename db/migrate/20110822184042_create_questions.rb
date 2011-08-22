class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :question
      t.string :question_type
      t.integer :score
      t.integer :order
      t.integer :lesson_template_id

      t.timestamps
    end
    add_index :questions, :lesson_template_id
  end

  def self.down
    drop_table :questions
  end
end
