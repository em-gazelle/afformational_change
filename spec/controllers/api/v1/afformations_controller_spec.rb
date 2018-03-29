require 'rails_helper'

RSpec.describe Api::V1::AfformationsController, type: :controller do
  let(:user1) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:user3) { Fabricate(:user) }
  let(:admin) { Fabricate(:user, admin: true) }
  let(:afformation_params) { Fabricate.to_params(:afformation) }
  let(:admin_afformation) { Fabricate(:afformation, afformation_text: "Admin Afformation") }
  let(:personal_afformation_user1) { Fabricate(:afformation, user_id: user1.id, afformation_text: "User1 Personal Afformation") }
  let(:personal_afformation_user2) { Fabricate(:afformation, user_id: user2.id, afformation_text: "User2 Personal Afformation") }
  
  def authenticated_header(user)
    token = Knock::AuthToken.new(payload: { sub: user1.id }).token

    {
      'Authorization': "Bearer #{token}"
    }
  end

  def authenticate_user(user)
    token = Knock::AuthToken.new(payload: { sub: user.id }).token
    request.env['HTTP_AUTHORIZATION'] = "Bearer #{token}"
  end

  describe 'GET #index' do
    
    before do
      personal_afformation_user1
      personal_afformation_user2
      admin_afformation
    end

    context 'when valid authorization token supplied' do
      context 'when user with personal afformation' do
        it 'returns ONLY personal user afformations and 200 status code' do
          authenticate_user(user1)
          get :index

          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)["afformations"]).to eq([JSON.parse(personal_afformation_user1.to_json)])
        end
      end
      context 'when user has no personal afformations' do
        it 'returns 200 with empty array for afformations object' do
          authenticate_user(user3)
          get :index

          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)["afformations"].empty?).to be true
        end
      end
      context 'when user is admin' do
        it 'returns only afformations with nil user id' do
          authenticate_user(admin)
          get :index

          expect(response.status).to eq(200)
          expect(JSON.parse(response.body)["afformations"]).to eq([JSON.parse(admin_afformation.to_json)])          
        end
      end
    end

    context 'when no auth token supplied' do
      it 'returns unauthorized 401 when no auth token, but user id sent' do
        get :index, params: { user_id: 1 }
        expect(response.status).to eq(401)
        expect(response.body.blank?).to be true
      end
      it 'returns unauthorized 401 when no auth token and no user id' do
        get :index
        expect(response.status).to eq(401)
        expect(response.body.blank?).to be true
      end
      # it 'returns unauthorized 401 when auth token is present, but invalid' do
      #   authenticate_user
      #   get :index

      #   expect(response.status).to eq(401)
      #   expect(response.body.blank?).to be true
      # end
    end
  end


end