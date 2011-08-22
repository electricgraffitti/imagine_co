require 'spec_helper'

describe "questions/index.html.erb" do
  before(:each) do
    assign(:questions, [
      stub_model(Question,
        :question => "Question",
        :question_type => "Question Type",
        :score => 1,
        :order => 1,
        :lesson_template_id => 1
      ),
      stub_model(Question,
        :question => "Question",
        :question_type => "Question Type",
        :score => 1,
        :order => 1,
        :lesson_template_id => 1
      )
    ])
  end

  it "renders a list of questions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Question Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
