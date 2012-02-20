# == Schema Information
#
# Table name: pictures
#
#  id               :integer(4)      not null, primary key
#  title            :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  attachable_id    :integer(4)
#  attachable_type  :string(255)
#  pic_file_name    :string(255)
#  pic_content_type :string(255)
#  pic_file_size    :integer(4)
#  pic_updated_at   :datetime
#

class Picture < ActiveRecord::Base
  
  # Associations
  belongs_to :attachable, :polymorphic => true
  
  has_attached_file :pic,
    :styles => { :regular => "275x275#", :avatar => "180x142#", :medium => "100x100#", :thumb => "75x75#", :micro => "50x50#" },
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :path => "/pictures/:id/:style_:basename.:extension"
    
end
