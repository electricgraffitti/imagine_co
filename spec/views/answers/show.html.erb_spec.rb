require 'spec_helper'

describe "answers/show.html.erb" do
  before(:each) do
    @answer = assign(:answer, stub_model(Answer,
      :question_id => 1,
      :answer => "Answer",
      :correct => "Correct"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Answer/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Correct/)
  end
end
