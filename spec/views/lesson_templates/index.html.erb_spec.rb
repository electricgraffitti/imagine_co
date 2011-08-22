require 'spec_helper'

describe "lesson_templates/index.html.erb" do
  before(:each) do
    assign(:lesson_templates, [
      stub_model(LessonTemplate,
        :name => "Name",
        :questions_count => 1
      ),
      stub_model(LessonTemplate,
        :name => "Name",
        :questions_count => 1
      )
    ])
  end

  it "renders a list of lesson_templates" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
