class CreateLessonTemplates < ActiveRecord::Migration
  def self.up
    create_table :lesson_templates do |t|
      t.string :name
      t.integer :questions_count

      t.timestamps
    end
  end

  def self.down
    drop_table :lesson_templates
  end
end
