class AddSubjectToLessonTemplates < ActiveRecord::Migration
  def self.up
    add_column :lesson_templates, :subject, :text
  end

  def self.down
    remove_column :lesson_templates, :subject
  end
end
