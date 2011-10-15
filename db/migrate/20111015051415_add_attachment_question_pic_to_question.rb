class AddAttachmentQuestionPicToQuestion < ActiveRecord::Migration
  def self.up
    add_column :questions, :question_pic_file_name, :string
    add_column :questions, :question_pic_content_type, :string
    add_column :questions, :question_pic_file_size, :integer
    add_column :questions, :question_pic_updated_at, :datetime
  end

  def self.down
    remove_column :questions, :question_pic_file_name
    remove_column :questions, :question_pic_content_type
    remove_column :questions, :question_pic_file_size
    remove_column :questions, :question_pic_updated_at
  end
end
