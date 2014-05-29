require 'spec_helper'

describe "friends/index" do
  before(:each) do
    assign(:friends, [
      stub_model(Friend),
      stub_model(Friend)
    ])
  end

  it "renders a list of friends" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
