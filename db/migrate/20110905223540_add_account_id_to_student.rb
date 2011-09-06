class AddAccountIdToStudent < ActiveRecord::Migration
  def self.up
    add_column :students, :account_id, :integer
  end

  def self.down
    remove_column :students, :account_id
  end
end
