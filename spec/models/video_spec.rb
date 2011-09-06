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

require 'spec_helper'

describe Video do
  pending "add some examples to (or delete) #{__FILE__}"
end
