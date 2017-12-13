class UserMailer < ApplicationMailer
	
	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Why are you so good at change?').deliver
	end

	def random_afformation
		@afformation = Afformation.all.shuffle.sample
		User.all.each do |user|
			@user = user
			mail(to: @user.email, subject: @afformation.afformation_text).deliver		
		end
	end

end
