module Api::V1
  class ApiController < ActionController::API
	include Knock::Authenticable

	before_action :authenticate_user
  end
end
