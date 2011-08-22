# == Schema Information
#
# Table name: lessons
#
#  id                 :integer(4)      not null, primary key
#  lesson_template_id :integer(4)
#  user_id            :integer(4)
#  video_watched      :boolean(1)
#  complete           :boolean(1)
#  score              :text
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe Lesson do
  pending "add some examples to (or delete) #{__FILE__}"
end
