require 'rails_helper'

RSpec.describe "employments/new", type: :view do
  before(:each) do
    assign(:employment, Employment.new(
      person: nil
    ))
  end

  it "renders new employment form" do
    render

    assert_select "form[action=?][method=?]", employments_path, "post" do

      assert_select "input[name=?]", "employment[person_id]"
    end
  end
end
