require 'rails_helper'

RSpec.describe "employments/edit", type: :view do
  before(:each) do
    @employment = assign(:employment, Employment.create!(
      person: nil
    ))
  end

  it "renders the edit employment form" do
    render

    assert_select "form[action=?][method=?]", employment_path(@employment), "post" do

      assert_select "input[name=?]", "employment[person_id]"
    end
  end
end
