require 'spec_helper'

describe "answers/new.html.erb" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :question_id => 1,
      :answer => "MyString",
      :correct => "MyString"
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path, :method => "post" do
      assert_select "input#answer_question_id", :name => "answer[question_id]"
      assert_select "input#answer_answer", :name => "answer[answer]"
      assert_select "input#answer_correct", :name => "answer[correct]"
    end
  end
end
