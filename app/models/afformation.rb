class Afformation < ActiveRecord::Base	
	has_many :users, through: :sent_afformations
	# applies only to user-submitted afformations
	belongs_to :user#, optional: true

	enum afformation_focus_area: { career: 0, health: 1, athletic: 2, positivity: 3 }

	validates_presence_of :afformation_text


end
