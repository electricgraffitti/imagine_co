# == Schema Information
#
# Table name: answers
#
#  id          :integer(4)      not null, primary key
#  question_id :integer(4)
#  answer      :string(255)
#  correct     :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#

require 'spec_helper'

describe Answer do
  pending "add some examples to (or delete) #{__FILE__}"
end
