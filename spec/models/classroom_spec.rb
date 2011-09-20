# == Schema Information
#
# Table name: classrooms
#
#  id         :integer(4)      not null, primary key
#  teacher_id :integer(4)
#  student_id :integer(4)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

require 'spec_helper'

describe Classroom do
  pending "add some examples to (or delete) #{__FILE__}"
end
