class Afformation < ActiveRecord::Base	
	include AfformationEnum

	has_many :users, through: :sent_afformations
	# applies only to user-submitted afformations
	belongs_to :user, required: false

	# enum afformation_focus_area: { career: 0, health: 1, athletic: 2, positivity: 3 }

	validates_presence_of :afformation_text


end
