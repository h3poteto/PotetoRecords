require 'spec_helper'

describe "menurecords/new" do
  before(:each) do
    assign(:menurecord, stub_model(Menurecord,
      :parent_id => 1,
      :name => "MyString",
      :color_tag => "MyString",
      :date => ""
    ).as_new_record)
  end

  it "renders new menurecord form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", menurecords_path, "post" do
      assert_select "input#menurecord_parent_id[name=?]", "menurecord[parent_id]"
      assert_select "input#menurecord_name[name=?]", "menurecord[name]"
      assert_select "input#menurecord_color_tag[name=?]", "menurecord[color_tag]"
      assert_select "input#menurecord_date[name=?]", "menurecord[date]"
    end
  end
end
