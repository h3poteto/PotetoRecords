require 'spec_helper'

describe "friends/show" do
  before(:each) do
    @friend = assign(:friend, stub_model(Friend))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
