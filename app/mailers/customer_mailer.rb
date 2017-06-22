class CustomerMailer < ApplicationMailer
	
	def welcome_email(customer)
		@customer = customer
		mail(to: @customer.email, subject: 'Why are you so good at change?').deliver
	end

	def random_afformation
		@afformation = Afformation.all.shuffle.sample
		Customer.all.each do |customer|
			@customer = customer
			mail(to: @customer.email, subject: @afformation.afformation_text).deliver		
		end
	end

end
