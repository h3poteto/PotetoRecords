require 'spec_helper'

describe "friends/new" do
  before(:each) do
    assign(:friend, stub_model(Friend).as_new_record)
  end

  it "renders new friend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friends_path, "post" do
    end
  end
end
