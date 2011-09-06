class AddAccessTypeToLessonTemplate < ActiveRecord::Migration
  def self.up
    add_column :lesson_templates, :public, :boolean
    add_column :lesson_templates, :private, :boolean
  end

  def self.down
    remove_column :lesson_templates, :private
    remove_column :lesson_templates, :public
  end
end
