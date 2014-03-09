require 'spec_helper'

describe "dogs/index" do
  before(:each) do
    assign(:dogs, [
      stub_model(Dog,
        :name => "Name",
        :breed => "Breed",
        :age => "Age",
        :features => "Features",
        :unique_features => "MyText",
        :is_lost => false,
        :is_found => false,
        :has_returned => false,
        :hero_id => 1,
        :location => "Location"
      ),
      stub_model(Dog,
        :name => "Name",
        :breed => "Breed",
        :age => "Age",
        :features => "Features",
        :unique_features => "MyText",
        :is_lost => false,
        :is_found => false,
        :has_returned => false,
        :hero_id => 1,
        :location => "Location"
      )
    ])
  end

  it "renders a list of dogs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Breed".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "Features".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
