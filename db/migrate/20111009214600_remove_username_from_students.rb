class RemoveUsernameFromStudents < ActiveRecord::Migration
  def self.up
    remove_column :students, :username
    remove_column :students, :account_id
    add_column :students, :student_key, :string
  end

  def self.down
    add_column :students, :username, :string
    add_column :students, :account_id, :integer
    remove_column :students, :student_key
  end
end
