require 'spec_helper'

describe "menurecords/show" do
  before(:each) do
    @menurecord = assign(:menurecord, stub_model(Menurecord,
      :parent_id => 1,
      :name => "Name",
      :color_tag => "Color Tag",
      :date => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    rendered.should match(/Name/)
    rendered.should match(/Color Tag/)
    rendered.should match(//)
  end
end
