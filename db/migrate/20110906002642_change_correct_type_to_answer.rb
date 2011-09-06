class ChangeCorrectTypeToAnswer < ActiveRecord::Migration
  def self.up
    
    change_column :answers, :correct, :boolean
    
  end

  def self.down
    
    change_column :answers, :correct, :string
    
  end
end
