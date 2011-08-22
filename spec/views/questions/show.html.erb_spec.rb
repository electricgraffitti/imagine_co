require 'spec_helper'

describe "questions/show.html.erb" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :question => "Question",
      :question_type => "Question Type",
      :score => 1,
      :order => 1,
      :lesson_template_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Question Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
