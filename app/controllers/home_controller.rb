class HomeController < ApplicationController
	skip_before_filter :authenticate_user!

	def show
	    @meta_title = meta_title 'Daily Afformations - Personal Progress, Evidence of Change'
		@meta_description = "Want to know how far you've come? To see evidence of how've you changed? To view and measure your progress? Here, you can see summaries of how many days you've been receiving afformations, journaled official responses to, and how many personal afformations you've created"

		if user_signed_in?
			set_user_counts
			@user_count_text = "So far, you've made " + @user_afformations_count.to_s + " personal afformations and have received " + @user_sent_afformations_count.to_s + " daily afformations, along with officially responding to " + @user_responses_count.to_s + " afformations."			
		else
			@user_count_text = ""
		end
	end

	private
		
	def set_user_counts
		@user_afformations_count = current_user.afformations.count

		user_sent_afformations = SentAfformation.where(user_id: current_user.id)
		@user_sent_afformations_count = user_sent_afformations.count
		@user_responses_count = user_sent_afformations.where.not(user_response_to_afformation: nil).count rescue 0
	end

end
