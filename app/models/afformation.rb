class Afformation < ActiveRecord::Base
	validates_presence_of :afformation_text
	
	has_many :users, through: :sent_afformations

	# applies only to user-submitted afformations
	belongs_to :afformations, optional: :true
end
