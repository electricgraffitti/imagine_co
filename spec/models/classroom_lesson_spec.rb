# == Schema Information
#
# Table name: classroom_lessons
#
#  id                 :integer(4)      not null, primary key
#  classroom_id       :integer(4)
#  lesson_template_id :integer(4)
#  created_at         :datetime
#  updated_at         :datetime
#

require 'spec_helper'

describe ClassroomLesson do
  pending "add some examples to (or delete) #{__FILE__}"
end
