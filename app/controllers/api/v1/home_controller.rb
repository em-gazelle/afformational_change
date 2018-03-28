module Api::V1  
	class HomeController < ApiController
		skip_before_filter :authenticate_user, only: [:first_time_or_logged_out]
		respond_to :json

		def first_time_or_logged_out
		end
	end
end
