class CreateCurriculums < ActiveRecord::Migration
  def self.up
    create_table :curriculums do |t|
      t.integer :teacher_id
      t.integer :lesson_template_id

      t.timestamps
    end
  end

  def self.down
    drop_table :curriculums
  end
end
