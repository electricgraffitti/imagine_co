class AddNameToClassrooms < ActiveRecord::Migration
  def self.up
    add_column :classrooms, :name, :string
  end

  def self.down
    remove_column :classrooms, :name
  end
end
