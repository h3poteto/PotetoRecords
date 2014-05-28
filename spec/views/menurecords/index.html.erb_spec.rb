require 'spec_helper'

describe "menurecords/index" do
  before(:each) do
    assign(:menurecords, [
      stub_model(Menurecord,
        :parent_id => 1,
        :name => "Name",
        :color_tag => "Color Tag",
        :date => ""
      ),
      stub_model(Menurecord,
        :parent_id => 1,
        :name => "Name",
        :color_tag => "Color Tag",
        :date => ""
      )
    ])
  end

  it "renders a list of menurecords" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Color Tag".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
