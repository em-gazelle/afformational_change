require 'rails_helper'

RSpec.describe Afformation, type: :model do
	describe 'validations' do
		context 'when valid' do
			it 'allows afformation without focus area specified to be built, assigns 0' do
				expect(Fabricate.build(:afformation, afformation_focus_area: nil)).to be_valid
			end
			it 'is valid and assigns integer enum to string input of afformation focus area' do
				expect((Fabricate.build(:afformation, afformation_focus_area: 1)).afformation_focus_area).to eq("career")
			end
		end
		context 'when invalid' do
			it 'is invalid when afformation text is missing' do
				expect(Fabricate.build(:afformation, afformation_text: nil))
			end
		end
	end
end
