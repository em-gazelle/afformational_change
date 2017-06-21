class CustomerMailer < ApplicationMailer
	
	def welcome_email(customer)
		@customer = customer
		mail(to: @customer.email, subject: 'Why are you so good at change?')
	end

end
