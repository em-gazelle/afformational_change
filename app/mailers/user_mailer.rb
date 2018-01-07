class UserMailer < ApplicationMailer
	
	def welcome_email(user_email)
		attachments.inline['path_water_sunsetrise.jpeg'] = File.read('app/assets/images/path_water_sunsetrise.jpeg').force_encoding('utf-8').encode
		mail(to: user_email, subject: 'How did you become so open to change?')
	end

	# def daily_afformation(user, afformation, random_file_name)
	def daily_afformation(user_id, afformation_id, random_image_file_name)
		@user = User.find(user_id)
		@afformation = Afformation.find(afformation_id)
		@random_image = random_image_file_name

		attachments.inline[@random_image] = File.read("app/assets/images/#{@random_image}").force_encoding('utf-8').encode
		
		mail(to: @user.email, subject: @afformation.afformation_text)
		SentAfformation.create!(afformation_id: @afformation.id, user_id: @user.id)
	end

end
