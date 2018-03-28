require 'rails_helper'

RSpec.describe Api::V1::AfformationsController, type: :controller do
  let(:user1) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:user3) { Fabricate(:user) }
  let(:admin) { Fabricate(:user, admin: true) }
  let(:afformation_params) { Fabricate.to_params(:afformation) }
  let(:admin_afformation) { Fabricate(:afformation) }
  let(:personal_afformation_user1) { Fabricate(:afformation, user_id: user1.id) }
  let(:personal_afformation_user2) { Fabricate(:afformation, user_id: user2.id) }
  
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  describe 'GET #index' do
    
    before do
      personal_afformation_user1
      personal_afformation_user2
      admin_afformation
    end

    context 'when valid authorization token supplied' do
      it 'returns user afformations and 200 status code' do
        get :index, headers: authenticated_header(user1)

        expect(JSON.parse(response.body)["afformations"][0]["afformation_text"]).to eq(personal_afformation_user1.afformation_text)
        expect(response.status).to eq(200)
      end
    end
    context 'when no auth token supplied' do
      it 'returns unauthorized 401' do
        get :index, user_id: 1
        expect(response.status).to eq(401)
        expect(JSON.parse(response.body)["message"]).to eq("Unauthorized user - please login and supply a valid authorization token for access to our API")
        # expect(JSON.parse(response.body)["afformations"].exists?).to be false
      end
    end
  end


end