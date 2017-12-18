class UserMailer < ApplicationMailer
	
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Why are you so good at change?').deliver
	end

	def daily_afformation(user, afformation)
		@user = user
		@afformation = afformation
		
		mail(to: @user.email, subject: @afformation.afformation_text)
		SentAfformation.create!(afformation_id: @afformation.id, user_id: @user.id)
	end

end
