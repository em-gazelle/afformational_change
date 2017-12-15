class Afformation < ActiveRecord::Base	
	include AfformationEnumMappings
	enum afformation_focus_area: Afformation.afformation_enum_mappings

	has_many :users, through: :sent_afformations
	# applies only to user-submitted afformations
	belongs_to :user, required: false

	validates_presence_of :afformation_text

end
