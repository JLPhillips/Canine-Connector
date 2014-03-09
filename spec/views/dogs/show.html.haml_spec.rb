require 'spec_helper'

describe "dogs/show" do
  before(:each) do
    @dog = assign(:dog, stub_model(Dog,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Breed/)
    rendered.should match(/Age/)
    rendered.should match(/Features/)
    rendered.should match(/MyText/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/1/)
    rendered.should match(/Location/)
  end
end
