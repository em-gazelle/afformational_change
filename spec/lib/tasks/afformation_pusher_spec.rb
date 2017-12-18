require "rails_helper"

RSpec.describe "rake db:send_afformations", type: :task do
	let(:unsubscribed_user) { Fabricate(:user, deactivated: true) }
	let(:user1) { Fabricate(:user) }
	let(:user2) { Fabricate(:user) }
	let(:user3) { Fabricate(:user) }

	let(:afformations) { Fabricate.times(5, :afformation, afformation_text: "Why am I so relateable?") }
	let(:personal_afformation_user1) { Fabricate(:afformation, afformation_text: "Why am I so unique?", user_id: user1.id) }

	before do
		unsubscribed_user
		user1
		user2
		user3
		afformations
		personal_afformation_user1
		ActionMailer::Base.deliveries = []
	end

	it "preloads the Rails environment" do
		expect(task.prerequisites).to include "environment"
	end
	it "runs and does not raise errors" do
		expect { task.execute }.not_to raise_error
	end
	it 'sends correct number of emails' do
		expect{ task.execute }.to change(ActionMailer::Base.deliveries, :count).by(3)
	end
	it 'sends emails to all unsubscribed users' do
		task.execute
		expect(ActionMailer::Base.deliveries.map(&:to).flatten).to eq([user1.email, user2.email, user3.email])
	end
	it 'creates SentAfformations in addition to emails' do
		expect{ task.execute }.to change(SentAfformation, :count).by(3)
	end
	it 'sends user2 email from afformations list' do
		15.times do
			task.execute
		end
		all_emails_user2 = ActionMailer::Base.deliveries.keep_if{|email| email.to == [user2.email]}.map(&:subject).uniq

		expect(all_emails_user2.size == 1 && all_emails_user2.first == afformations.first.afformation_text).to be true
	end
	it 'sends personal email to user1' do
		15.times do
			task.execute
		end
		expect(ActionMailer::Base.deliveries.keep_if{|email| email.to == [user1.email]}.map(&:subject).include?(personal_afformation_user1.afformation_text)).to be true
	end	
end