class AddAdminBooleanToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :admin, :boolean
  end

  def self.down
    remove_column :teachers, :admin
  end
end
