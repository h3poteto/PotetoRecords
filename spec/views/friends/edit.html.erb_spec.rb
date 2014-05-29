require 'spec_helper'

describe "friends/edit" do
  before(:each) do
    @friend = assign(:friend, stub_model(Friend))
  end

  it "renders the edit friend form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", friend_path(@friend), "post" do
    end
  end
end
