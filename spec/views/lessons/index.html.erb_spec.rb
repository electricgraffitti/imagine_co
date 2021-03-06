require 'spec_helper'

describe "lessons/index.html.erb" do
  before(:each) do
    assign(:lessons, [
      stub_model(Lesson,
        :lesson_template_id => 1,
        :user_id => 1,
        :video_watched => false,
        :complete => false,
        :score => "MyText"
      ),
      stub_model(Lesson,
        :lesson_template_id => 1,
        :user_id => 1,
        :video_watched => false,
        :complete => false,
        :score => "MyText"
      )
    ])
  end

  it "renders a list of lessons" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => false.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
