module Api::V1  
	class HomeController < ApiController
		skip_before_action :authenticate_user, only: [:first_time_or_logged_out]
		respond_to :json

		def first_time_or_logged_out
			render json: { status: :ok }
		end
	end
end
