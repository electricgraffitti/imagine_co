class AddIdsToLessonTemplates < ActiveRecord::Migration
  def self.up
    add_column :lesson_templates, :teacher_id, :integer
    add_column :lesson_templates, :account_id, :integer
  end

  def self.down
    remove_column :lesson_templates, :account_id
    remove_column :lesson_templates, :teacher_id
  end
end
