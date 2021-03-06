class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception
	before_action :authenticate_user!
	before_action :configure_permitted_parameters, if: :devise_controller?

  	BRAND_NAME = 'Daily Afformations'.freeze

	def meta_title(title)
		[title, BRAND_NAME].reject(&:empty?).join(' | ')
	end

	protected

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:personal_afformation_focus_area => []])
	end

end
