module AfformationEnum
  extend ActiveSupport::Concern
  included do 
	enum afformation_focus_areas: { general: 0, career: 1, health: 2, athletic: 3 }
  end
end
