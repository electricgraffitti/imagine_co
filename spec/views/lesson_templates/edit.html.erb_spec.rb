require 'spec_helper'

describe "lesson_templates/edit.html.erb" do
  before(:each) do
    @lesson_template = assign(:lesson_template, stub_model(LessonTemplate,
      :name => "MyString",
      :questions_count => 1
    ))
  end

  it "renders the edit lesson_template form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lesson_templates_path(@lesson_template), :method => "post" do
      assert_select "input#lesson_template_name", :name => "lesson_template[name]"
      assert_select "input#lesson_template_questions_count", :name => "lesson_template[questions_count]"
    end
  end
end
