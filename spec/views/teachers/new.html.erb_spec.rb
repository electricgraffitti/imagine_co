require 'spec_helper'

describe "teachers/new.html.erb" do
  before(:each) do
    assign(:teacher, stub_model(Teacher,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :password => "MyString"
    ).as_new_record)
  end

  it "renders new teacher form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => teachers_path, :method => "post" do
      assert_select "input#teacher_first_name", :name => "teacher[first_name]"
      assert_select "input#teacher_last_name", :name => "teacher[last_name]"
      assert_select "input#teacher_email", :name => "teacher[email]"
      assert_select "input#teacher_password", :name => "teacher[password]"
    end
  end
end
