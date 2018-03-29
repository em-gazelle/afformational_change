require 'rails_helper'

RSpec.describe AfformationsController, type: :controller do
  let(:user1) { Fabricate(:user) }
  let(:user2) { Fabricate(:user) }
  let(:user3) { Fabricate(:user) }
  let(:admin) { Fabricate(:user, admin: true) }
  let(:afformation_params) { Fabricate.to_params(:afformation) }
  let(:admin_afformation) { Fabricate(:afformation) }
  let(:personal_afformation_user1) { Fabricate(:afformation, user_id: user1.id) }
  let(:personal_afformation_user2) { Fabricate(:afformation, user_id: user2.id) }

  describe 'POST #create' do
      context 'submitted by non-admin : personal afformation' do
        it 'creates afformation with associated user id & sets user_submitted_personal_afformation to true' do
          sign_in user1
          post :create, params: { afformation: afformation_params }
          expect(assigns(:afformation).user_id).to eq(user1.id)
          expect(response).to redirect_to(afformations_url)
        end
      end
      context 'submitted by admin' do
        it 'creates afformation with user id field null, no errors, and user_submitted_personal_afformation set to false' do
          sign_in admin
          post :create, params: { afformation: afformation_params }
          expect(assigns(:afformation).user_id).to be nil
          expect(response).to redirect_to(afformations_url)
        end
      end
  end

  describe 'PUT #update' do
    context 'when all fields are valid' do
      it 'changes afformation_focus_area' do
      end
    end
    context 'when personal afformation by user' do
      it 'does not change user id or boolean flag on user_submitted_personal_afformation' do
      end
    end
  end

  describe 'GET #index' do
    
    before do
      personal_afformation_user1
      personal_afformation_user2
      admin_afformation
    end

    context 'when admin' do
      it 'shows list of all afformations that are not user-submitted' do
        sign_in admin
        get :index
        expect(assigns(:afformations).pluck(:user_id).compact.blank?).to eq(true)
      end
      # it 'does not show list of personal submitted afformations; keeps them private. Gives number of total personal submitted afformations only' do
      # end
    end
    context 'when general user' do
      it 'shows list of all personal submitted afformations. Hides and does not display list of general and personal submitted afformations that do not belong to user' do
        sign_in user1
        get :index
        expect(assigns(:afformations).pluck(:user_id).uniq).to eq([user1.id])
      end
      it 'does not throw errors or display any afforrmations for non-admin who has no personal afformations' do
        sign_in user3
        get :index
        expect(assigns(:afformations).blank?).to be true
      end
    end
  end

  # describe 'GET #show' do
  # end
  describe 'DELETE #destroy' do
    before do
      admin_afformation
      personal_afformation_user1
      personal_afformation_user2
    end

    context 'when admin' do
      before do 
        sign_in admin
      end

      it 'destroys afformations with no user_id' do
        expect{
          delete :destroy, params: { id: admin_afformation.id }
        }.to change(Afformation, :count).by(-1)
      end
      it 'does not delete afformations with user_id not nil' do
        expect{
          delete :destroy, params: { id: personal_afformation_user1.id }
        }.to change(Afformation, :count).by(0)
      end
    end
    context 'when user' do
      before do 
        sign_in user1
      end

      it 'destroys afformations that match user_id' do
        expect{
          delete :destroy, params: { id: personal_afformation_user1.id }
        }.to change(Afformation, :count).by(-1)
      end
      it 'does not delete afformations that have no user_id' do
        expect{
          delete :destroy, params: { id: admin_afformation.id }
        }.to change(Afformation, :count).by(0)
      end
      it 'does not delete afformations that have a different user_id' do
        expect{
          delete :destroy, params: { id: personal_afformation_user2.id }
        }.to change(Afformation, :count).by(0)
      end
    end
  end

end
