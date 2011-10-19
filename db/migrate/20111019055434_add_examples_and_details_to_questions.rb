class AddExamplesAndDetailsToQuestions < ActiveRecord::Migration
  def self.up
    add_column :questions, :example, :string
    add_column :questions, :details, :string
  end

  def self.down
    remove_column :questions, :details
    remove_column :questions, :example
  end
end
