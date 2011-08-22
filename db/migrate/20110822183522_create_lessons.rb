class CreateLessons < ActiveRecord::Migration
  def self.up
    create_table :lessons do |t|
      t.integer :lesson_template_id
      t.integer :user_id
      t.boolean :video_watched
      t.boolean :complete
      t.text :score

      t.timestamps
    end
    add_index :lessons, :user_id
    add_index :lessons, :lesson_template_id
  end

  def self.down
    drop_table :lessons
  end
end
