class AddAttachableIdToPictures < ActiveRecord::Migration
  def self.up
    add_column :pictures, :attachable_id, :integer
    add_column :pictures, :attachable_type, :string
    add_column :videos, :viewable_id, :integer
    add_column :videos, :viewable_type, :string
  end

  def self.down
    remove_column :pictures, :attachable_type
    remove_column :pictures, :attachable_id
    remove_column :videos, :viewable_id
    remove_column :videos, :viewable_type
  end
end
