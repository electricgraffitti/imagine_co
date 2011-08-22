class Picture < ActiveRecord::Base
  
  # Associations
  belongs_to :attachable, :polymorphic => true
  
  has_attached_file :pic,
    :styles => { :regular => "275x275#", :avatar => "180x142#", :medium => "100x100#", :thumb => "75x75#", :micro => "50x50#" },
    :storage => :s3,
    :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
    :path => "/pictures/:id/:style_:basename.:extension"
    
end
