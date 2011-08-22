require 'spec_helper'

describe "lessons/show.html.erb" do
  before(:each) do
    @lesson = assign(:lesson, stub_model(Lesson,
      :lesson_template_id => 1,
      :user_id => 1,
      :video_watched => false,
      :complete => false,
      :score => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/false/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
  end
end
