class UserMailer < ApplicationMailer
	
	def welcome_email(user_email)
		attachments.inline['path_water_sunsetrise.jpeg'] = File.read('app/assets/images/path_water_sunsetrise.jpeg').force_encoding('utf-8').encode
		mail(to: user_email, subject: 'How did you become so open to change?')
	end

	def daily_afformation(user, afformation)
		@user = user
		@afformation = afformation

		@random_image = random_image_from_directory
		attachments.inline[@random_image] = File.read("app/assets/images/#{@random_image}").force_encoding('utf-8').encode
		
		mail(to: @user.email, subject: @afformation.afformation_text)
		SentAfformation.create!(afformation_id: @afformation.id, user_id: @user.id)
	end

	private

	def random_image_from_directory
	    images_path_prefix = "app/assets/images/"
	    image_files = Dir.glob("#{images_path_prefix}*")
	    image_files.sample.remove(images_path_prefix)
	end

end
