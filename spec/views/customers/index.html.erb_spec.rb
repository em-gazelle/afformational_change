require 'rails_helper'

RSpec.describe "customers/index", type: :view do
  before(:each) do
    assign(:customers, [
      Customer.create!(
        :email => "Email",
        :phone => "Phone",
        :name => "Name",
        :timezone => "Timezone"
      ),
      Customer.create!(
        :email => "Email",
        :phone => "Phone",
        :name => "Name",
        :timezone => "Timezone"
      )
    ])
  end

  it "renders a list of customers" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Timezone".to_s, :count => 2
  end
end
