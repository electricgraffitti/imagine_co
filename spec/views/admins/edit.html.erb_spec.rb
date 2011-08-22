require 'spec_helper'

describe "admins/edit.html.erb" do
  before(:each) do
    @admin = assign(:admin, stub_model(Admin,
      :username => "MyString",
      :password => "MyString"
    ))
  end

  it "renders the edit admin form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => admins_path(@admin), :method => "post" do
      assert_select "input#admin_username", :name => "admin[username]"
      assert_select "input#admin_password", :name => "admin[password]"
    end
  end
end
