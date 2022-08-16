require 'rails_helper'

RSpec.describe "employments/show", type: :view do
  before(:each) do
    @employment = assign(:employment, Employment.create!(
      person: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
