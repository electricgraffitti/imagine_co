class Video < ActiveRecord::Base
  
  # Associations
  belongs_to :viewable, :polymorphic => true
  
  # Validations
  
  # Paperclip
  has_attached_file :video,
        :storage => :s3,
        :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
        :path => "/videos/:attachment/:id/:style/:basename.:extension"

  # Paperclip Validations
  validates_attachment_presence :video
  validates_attachment_content_type :video, :content_type => ['application/x-shockwave-flash', 'application/x-shockwave-flash', 'application/flv', 'video/x-flv']
  
end
