# == Schema Information
#
# Table name: videos
#
#  id                 :integer(4)      not null, primary key
#  title              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  viewable_id        :integer(4)
#  viewable_type      :string(255)
#  video_file_name    :string(255)
#  video_content_type :string(255)
#  video_file_size    :integer(4)
#  video_updated_at   :datetime
#

class Video < ActiveRecord::Base
  
  # Associations
  belongs_to :viewable, :polymorphic => true
  
  # Validations
  
  # Paperclip
  has_attached_file :video,
        :storage => :s3,
        :s3_credentials => "#{Rails.root}/config/s3.yml",
        :path => "/videos/:attachment/:id/:style/:basename.:extension"

  # Paperclip Validations
  validates_attachment_presence :video
  validates_attachment_content_type :video, :content_type => ['application/x-shockwave-flash', 'application/x-shockwave-flash', 'application/flv', 'video/x-flv']
  
end
