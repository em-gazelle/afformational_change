class Afformation < ActiveRecord::Base	
	include AfformationEnumMappings

	enum afformation_focus_area: Afformation.afformation_enum_mappings
	# enum afformation_focus_area: { general: 0, career: 1, health: 2, athletic: 3 }

	has_many :users, through: :sent_afformations
	# applies only to user-submitted afformations
	belongs_to :user, required: false

	validates_presence_of :afformation_text

end
