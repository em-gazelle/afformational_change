require 'rails_helper'

RSpec.describe "afformations/new", type: :view do
  before(:each) do
    assign(:afformation, Afformation.new(
      :afformation_text => "MyString"
    ))
  end

  it "renders new afformation form" do
    render

    assert_select "form[action=?][method=?]", afformations_path, "post" do

      assert_select "input#afformation_afformation_text[name=?]", "afformation[afformation_text]"
    end
  end
end
