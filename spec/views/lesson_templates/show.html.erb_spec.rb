require 'spec_helper'

describe "lesson_templates/show.html.erb" do
  before(:each) do
    @lesson_template = assign(:lesson_template, stub_model(LessonTemplate,
      :name => "Name",
      :questions_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
