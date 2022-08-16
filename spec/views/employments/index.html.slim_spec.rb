require 'rails_helper'

RSpec.describe "employments/index", type: :view do
  before(:each) do
    assign(:employments, [
      Employment.create!(
        person: nil
      ),
      Employment.create!(
        person: nil
      )
    ])
  end

  it "renders a list of employments" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
