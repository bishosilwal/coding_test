require 'rails_helper'

RSpec.describe "people/new", type: :view do
  before(:each) do
    assign(:person, Person.new(
      first_name: "MyString",
      last_name: "MyString",
      nickname: "MyString",
      email: "MyString",
      phone: "MyString"
    ))
  end

  it "renders new person form" do
    render

    assert_select "form[action=?][method=?]", people_path, "post" do

      assert_select "input[name=?]", "person[first_name]"

      assert_select "input[name=?]", "person[last_name]"

      assert_select "input[name=?]", "person[nickname]"

      assert_select "input[name=?]", "person[email]"

      assert_select "input[name=?]", "person[phone]"
    end
  end
end
