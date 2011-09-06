class AddAccountIdToTeacher < ActiveRecord::Migration
  def self.up
    add_column :teachers, :account_id, :integer
  end

  def self.down
    remove_column :teachers, :account_id
  end
end
