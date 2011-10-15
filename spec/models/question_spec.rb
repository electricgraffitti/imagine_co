# == Schema Information
#
# Table name: questions
#
#  id                        :integer(4)      not null, primary key
#  question                  :string(255)
#  question_type             :string(255)
#  score                     :integer(4)
#  order                     :integer(4)
#  lesson_template_id        :integer(4)
#  created_at                :datetime
#  updated_at                :datetime
#  question_pic_file_name    :string(255)
#  question_pic_content_type :string(255)
#  question_pic_file_size    :integer(4)
#  question_pic_updated_at   :datetime
#

require 'spec_helper'

describe Question do
  pending "add some examples to (or delete) #{__FILE__}"
end
