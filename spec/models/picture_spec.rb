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

require 'spec_helper'

describe Picture do
  pending "add some examples to (or delete) #{__FILE__}"
end
