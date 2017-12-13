require 'rails_helper'

RSpec.describe User, type: :model do
	# let(:user_params) { Fabricate(:user).to_params }
	let(:focus_area_one) { "health" }
	let(:focus_area_two) { "career" }
	let(:focus_area_three) { "athletic" }

	describe 'validations' do
		context 'when invalid' do
			it 'does not create user with improper email address in blah @ without domain format' do
				expect(Fabricate.build(:user, email: "millie@")).to_not be_valid
			end
			# address email formatted as millie@gg ... improper domain and lacking .com
			it 'does not create user without a name' do
				expect(Fabricate.build(:user, name: nil)).to_not be_valid
			end
		end
		context 'when valid' do
			it 'creates user without personal aff focus areas specified' do
				expect(Fabricate.build(:user, personal_afformation_focus_area: nil)).to be_valid
			end
			it 'creates user when personal_afformation_focus_areas specified' do
				expect(Fabricate.build(:user, personal_afformation_focus_area: [focus_area_one])).to be_valid
			end
		end
	end
	describe 'enum check on personal_afformation_focus_areas' do
		context 'when array is empty' do
			it 'creates user with array. inserts general' do
				expect((Fabricate(:user, personal_afformation_focus_area: nil)).personal_afformation_focus_area).to eq(["general"])
			end
		end
		context 'when array has 1+ field selected' do
			it 'translates array string values to appropriate enums with one only selected' do
				expect((Fabricate(:user, personal_afformation_focus_area: [focus_area_one])).personal_afformation_focus_area).to eq([focus_area_one])		
			end
			it 'translates string values to appropriate enums with more than one selected' do
				expect((Fabricate(:user, personal_afformation_focus_area: [focus_area_one, focus_area_two])).personal_afformation_focus_area).to eq([focus_area_one, focus_area_two])		
			end
			it 'empties array if ALL specified focus areas are selected and assigns general' do
				expect((Fabricate(:user, personal_afformation_focus_area: [focus_area_one, focus_area_two, focus_area_three])).personal_afformation_focus_area).to eq(["general"])
			end
		end
	end
end
