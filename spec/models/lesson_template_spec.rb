# == Schema Information
#
# Table name: lesson_templates
#
#  id              :integer(4)      not null, primary key
#  name            :string(255)
#  questions_count :integer(4)
#  created_at      :datetime
#  updated_at      :datetime
#  public          :boolean(1)
#  private         :boolean(1)
#  teacher_id      :integer(4)
#  account_id      :integer(4)
#  subject         :text
#

require 'spec_helper'

describe LessonTemplate do
  pending "add some examples to (or delete) #{__FILE__}"
end
