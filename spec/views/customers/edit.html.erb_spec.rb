require 'rails_helper'

RSpec.describe "customers/edit", type: :view do
  before(:each) do
    @customer = assign(:customer, Customer.create!(
      :email => "MyString",
      :phone => "MyString",
      :name => "MyString",
      :timezone => "MyString"
    ))
  end

  it "renders the edit customer form" do
    render

    assert_select "form[action=?][method=?]", customer_path(@customer), "post" do

      assert_select "input#customer_email[name=?]", "customer[email]"

      assert_select "input#customer_phone[name=?]", "customer[phone]"

      assert_select "input#customer_name[name=?]", "customer[name]"

      assert_select "input#customer_timezone[name=?]", "customer[timezone]"
    end
  end
end
