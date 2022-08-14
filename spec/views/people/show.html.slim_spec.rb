require 'rails_helper'

RSpec.describe "people/show", type: :view do
  before(:each) do
    @person = assign(:person, Person.create!(
      first_name: "First Name",
      last_name: "Last Name",
      nickname: "Nickname",
      email: "Email",
      phone: "Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Nickname/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
  end
end
