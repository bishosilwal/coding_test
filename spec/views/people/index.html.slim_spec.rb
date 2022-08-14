require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        first_name: "First Name",
        last_name: "Last Name",
        nickname: "Nickname",
        email: "Email",
        phone: "Phone"
      ),
      Person.create!(
        first_name: "First Name",
        last_name: "Last Name",
        nickname: "Nickname",
        email: "Email",
        phone: "Phone"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", text: "First Name".to_s, count: 2
    assert_select "tr>td", text: "Last Name".to_s, count: 2
    assert_select "tr>td", text: "Nickname".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: "Phone".to_s, count: 2
  end
end
