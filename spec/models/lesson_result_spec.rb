# == Schema Information
#
# Table name: lesson_results
#
#  id             :integer(4)      not null, primary key
#  lesson_id      :integer(4)
#  question_id    :integer(4)
#  student_answer :text
#  answer_state   :text
#  created_at     :datetime
#  updated_at     :datetime
#

require 'spec_helper'

describe LessonResult do
  pending "add some examples to (or delete) #{__FILE__}"
end
