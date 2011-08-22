require 'spec_helper'

describe "questions/edit.html.erb" do
  before(:each) do
    @question = assign(:question, stub_model(Question,
      :question => "MyString",
      :question_type => "MyString",
      :score => 1,
      :order => 1,
      :lesson_template_id => 1
    ))
  end

  it "renders the edit question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questions_path(@question), :method => "post" do
      assert_select "input#question_question", :name => "question[question]"
      assert_select "input#question_question_type", :name => "question[question_type]"
      assert_select "input#question_score", :name => "question[score]"
      assert_select "input#question_order", :name => "question[order]"
      assert_select "input#question_lesson_template_id", :name => "question[lesson_template_id]"
    end
  end
end
