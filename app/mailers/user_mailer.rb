class UserMailer < ApplicationMailer
	
	def welcome_email(user_email)
		mail(to: user_email, subject: 'How did you become so open to change?')
	end

	def daily_afformation(user, afformation)
		@user = user
		@afformation = afformation
		
		mail(to: @user.email, subject: @afformation.afformation_text)
		SentAfformation.create!(afformation_id: @afformation.id, user_id: @user.id)
	end

end
