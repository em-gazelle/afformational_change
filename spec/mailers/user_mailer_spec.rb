require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
	let(:user1) { Fabricate(:user) }
	let(:personal_afformation_user1) { Fabricate(:afformation, user_id: user1.id) }
	

	describe 'daily_random_afformations' do
		it 'sends user email with random afformation' do
			expect{
				UserMailer.daily_afformation(user1, personal_afformation_user1).deliver_now
			}.to change(ActionMailer::Base.deliveries, :count).by(1)
		end
		it 'creates a sent afformation with user and afformation ids' do
			expect{
				UserMailer.daily_afformation(user1, personal_afformation_user1).deliver_now
			}.to change(SentAfformation, :count).by(1)
		end
	end
end
