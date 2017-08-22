class User < ActiveRecord::Base
	has_many :afformations, through: :sent_afformations
	# optional, user submitted only
	has_many :afformations
	
	validates_presence_of :email, :name	
end
