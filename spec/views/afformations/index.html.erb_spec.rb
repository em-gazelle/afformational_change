require 'rails_helper'

RSpec.describe "afformations/index", type: :view do
  before(:each) do
    assign(:afformations, [
      Afformation.create!(
        :afformation_text => "Afformation Text"
      ),
      Afformation.create!(
        :afformation_text => "Afformation Text"
      )
    ])
  end

  it "renders a list of afformations" do
    render
    assert_select "tr>td", :text => "Afformation Text".to_s, :count => 2
  end
end
