require 'rails_helper'

RSpec.describe Api::V1::HomeController, type: :controller do
	describe 'GET #first_time_or_logged_out' do
		it 'returns 200 when user does NOT supply auth token' do
			get :first_time_or_logged_out
			expect(response.status).to eq(200)
		end
	end
end