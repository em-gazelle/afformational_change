require 'rails_helper'

RSpec.describe SentAfformationsController, type: :controller do

	let(:user_without_sent_afformations) { Fabricate(:user) }
	let(:user_with_sent_afformations) { Fabricate(:user) }
	let(:afformation) { Fabricate(:afformation) }
	let(:sent_afformation) { Fabricate(:sent_afformation, user_id: user_with_sent_afformations.id, afformation_id: afformation.id) }

	describe 'GET #index' do
		before do
			afformation
			sent_afformation
		end

		context 'user has no sent afformations' do
			before do
				sign_in user_without_sent_afformations
				get :index
			end

			it 'throws no errors' do
				expect(response).to have_http_status(:success)
			end
			it 'assigns sent_afformations to []' do
				expect(assigns(:sent_afformations)).to eq([])
			end
		end
		context 'user has afformations that have been sent out' do
			before do
				sign_in user_with_sent_afformations
				get :index
			end

			it 'assigns all sent_afformation belonging to user_with_sent_afformations' do
				expect(assigns(:sent_afformations).first).to eq(sent_afformation)
			end
		end
	end

	describe 'PUT #update' do
		context 'user is authorized to edit sent_afformation' do
			before do
				sign_in user_with_sent_afformations
			end
			it 'throws error and does not change sent_afformation if fields not allowed' do
				put :update, id: sent_afformation.id, sent_afformation: { user_response_to_afformation: "Code~", user_id: user_without_sent_afformations.id }				
				expect(response).to redirect_to(action: :index)
			end
			it 'updates sent_afformation when params valid and redirects to index' do
				put :update, id: sent_afformation.id, sent_afformation: { user_response_to_afformation: "Code~" }
				expect(response).to redirect_to(action: :index)
			end
		end

		context 'unauthorized user tries to update sent afformation' do
			before do
				sign_in user_without_sent_afformations
				sent_afformation
				put :update, id: sent_afformation.id, sent_afformation: { user_response_to_afformation: "By answering other people's questions!" }
			end
			it 'does not update sent_afformation' do	
				expect(sent_afformation.user_response_to_afformation).to eq(nil)
			end
			it 'redirects to index page and gives unauthorized notice' do
				expect(response).to redirect_to(action: :index)
				expect(flash[:notice]).to eq("You are not authorized to perform this action.")
			end
		end
	end
end

