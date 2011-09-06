require 'spec_helper'

describe "teachers/index.html.erb" do
  before(:each) do
    assign(:teachers, [
      stub_model(Teacher,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password => "Password"
      ),
      stub_model(Teacher,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :password => "Password"
      )
    ])
  end

  it "renders a list of teachers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Password".to_s, :count => 2
  end
end
