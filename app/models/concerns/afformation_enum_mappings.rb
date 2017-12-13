module AfformationEnumMappings
  extend ActiveSupport::Concern
  included do 
	def self.afformation_enum_mappings
		{ general: 0, career: 1, health: 2, athletic: 3 }
  	end
  end
end