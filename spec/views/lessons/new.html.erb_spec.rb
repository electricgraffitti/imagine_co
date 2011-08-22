require 'spec_helper'

describe "lessons/new.html.erb" do
  before(:each) do
    assign(:lesson, stub_model(Lesson,
      :lesson_template_id => 1,
      :user_id => 1,
      :video_watched => false,
      :complete => false,
      :score => "MyText"
    ).as_new_record)
  end

  it "renders new lesson form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => lessons_path, :method => "post" do
      assert_select "input#lesson_lesson_template_id", :name => "lesson[lesson_template_id]"
      assert_select "input#lesson_user_id", :name => "lesson[user_id]"
      assert_select "input#lesson_video_watched", :name => "lesson[video_watched]"
      assert_select "input#lesson_complete", :name => "lesson[complete]"
      assert_select "textarea#lesson_score", :name => "lesson[score]"
    end
  end
end
