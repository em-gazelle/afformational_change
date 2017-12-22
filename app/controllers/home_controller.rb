class HomeController < ApplicationController
	skip_before_filter :authenticate_user!

	def index
	end

	def show
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
