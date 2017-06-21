require 'rails_helper'

RSpec.describe "customers/show", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :email => "Email",
      :phone => "Phone",
      :name => "Name",
      :timezone => "Timezone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Timezone/)
  end
end
