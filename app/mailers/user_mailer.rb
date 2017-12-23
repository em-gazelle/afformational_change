class UserMailer < ApplicationMailer
	
	def welcome_email(user_email)
		attachments.inline['path_water_sunsetrise.jpeg'] = {content: File.read("#{Rails.root}/app/assets/images/path_water_sunsetrise.jpeg"), content_id: 'logo'}
		@welcome_picture =  attachments['path_water_sunsetrise.jpeg']
		mail(to: user_email, subject: 'How did you become so open to change?')
	end

	def daily_afformation(user, afformation)
		@user = user
		@afformation = afformation

		@random_image = random_image_from_directory
		attachments.inline[@random_image] = {content: File.read("#{Rails.root}/app/assets/images/#{@random_image}"), content_id: 'logo'}
		@afformation_picture =  attachments[@random_image]
		
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
