require 'rails_helper'

RSpec.describe "afformations/show", type: :view do
  before(:each) do
    @afformation = assign(:afformation, Afformation.create!(
      :afformation_text => "Afformation Text"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Afformation Text/)
  end
end
