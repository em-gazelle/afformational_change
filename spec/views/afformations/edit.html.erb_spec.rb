require 'rails_helper'

RSpec.describe "afformations/edit", type: :view do
  before(:each) do
    @afformation = assign(:afformation, Afformation.create!(
      :afformation_text => "MyString"
    ))
  end

  it "renders the edit afformation form" do
    render

    assert_select "form[action=?][method=?]", afformation_path(@afformation), "post" do

      assert_select "input#afformation_afformation_text[name=?]", "afformation[afformation_text]"
    end
  end
end
