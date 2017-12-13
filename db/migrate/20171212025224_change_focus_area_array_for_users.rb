class ChangeFocusAreaArrayForUsers < ActiveRecord::Migration
  def change
	change_column_default :users, :afformation_focus_areas, []
	rename_column :users, :afformation_focus_areas, :personal_afformation_focus_areas
  end
end
