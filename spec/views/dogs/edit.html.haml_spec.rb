require 'spec_helper'

describe "dogs/edit" do
  before(:each) do
    @dog = assign(:dog, stub_model(Dog,
      :name => "MyString",
      :breed => "MyString",
      :age => "MyString",
      :features => "MyString",
      :unique_features => "MyText",
      :is_lost => false,
      :is_found => false,
      :has_returned => false,
      :hero_id => 1,
      :location => "MyString"
    ))
  end

  it "renders the edit dog form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", dog_path(@dog), "post" do
      assert_select "input#dog_name[name=?]", "dog[name]"
      assert_select "input#dog_breed[name=?]", "dog[breed]"
      assert_select "input#dog_age[name=?]", "dog[age]"
      assert_select "input#dog_features[name=?]", "dog[features]"
      assert_select "textarea#dog_unique_features[name=?]", "dog[unique_features]"
      assert_select "input#dog_is_lost[name=?]", "dog[is_lost]"
      assert_select "input#dog_is_found[name=?]", "dog[is_found]"
      assert_select "input#dog_has_returned[name=?]", "dog[has_returned]"
      assert_select "input#dog_hero_id[name=?]", "dog[hero_id]"
      assert_select "input#dog_location[name=?]", "dog[location]"
    end
  end
end
