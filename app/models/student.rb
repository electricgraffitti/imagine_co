# == Schema Information
#
# Table name: students
#
#  id                  :integer(4)      not null, primary key
#  first_name          :string(255)
#  last_name           :string(255)
#  email               :string(255)
#  username            :string(255)
#  crypted_password    :string(255)
#  password_salt       :string(255)
#  persistence_token   :string(255)
#  single_access_token :string(255)
#  perishable_token    :string(255)
#  login_count         :integer(4)
#  failed_login_count  :integer(4)
#  last_request_at     :datetime
#  current_login_at    :datetime
#  last_login_at       :datetime
#  current_login_ip    :string(255)
#  last_login_ip       :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#  account_id          :integer(4)
#

class Student < ActiveRecord::Base
  
  #Associations
  belongs_to :account
  
  #Authlogic
  acts_as_authentic do |c|
    c.logged_in_timeout = 120.minutes
  end
  
  def full_name
    fullname = self.first_name + " " + self.last_name
    return fullname
  end
  
end
