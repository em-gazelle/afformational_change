module AfformationEnum
  extend ActiveSupport::Concern
  included do
	enum afformation_focus_areas: { career: 0, health: 1, athletic: 2, positivity: 3 }
  end
end
