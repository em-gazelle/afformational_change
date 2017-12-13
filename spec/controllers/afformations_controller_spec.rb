require 'rails_helper'

RSpec.describe AfformationsController, type: :controller do
  # let(:user) { Fabricate(:user) }
  # let(:super_user) {Fabricate(:user, super_user: true)}

  describe 'POST #create' do
      context 'submitted by non-super-user : personal afformation' do
        it 'creates afformation with associated user id & sets user_submitted_personal_afformation to true' do
        end
      end
      context 'submitted by superuser' do
        it 'creates afformation with user id field null, no errors, and user_submitted_personal_afformation set to false' do
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
    context 'when superuser' do
      it 'shows list of all afformations that are not user-submitted' do
      end
      it 'does not show list of personal submitted afformations; keeps them private. Gives number of total personal submitted afformations only' do
      end
    end
    context 'when general user' do
      it 'shows list of all personal submitted afformations. Hides and does not display list of general and personal submitted afformations that do not belong to user' do
      end
    end
  end

  # describe 'GET #show' do
  # end
  describe 'DELETE #destroy' do
    it 'destroys afformation' do
    end
  end

end
