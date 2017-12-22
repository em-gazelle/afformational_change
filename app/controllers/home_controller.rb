class HomeController < ApplicationController
  def index
  end

  def show
	@user_afformations_count = current_user.afformations.count

	user_sent_afformations = SentAfformation.where(user_id: current_user.id)
	@user_sent_afformations_count = user_sent_afformations.count
	@user_responses_count = user_sent_afformations.where.not(user_response_to_afformation: nil).count
  end

end
