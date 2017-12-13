class RemoveEnumsFromUsersAfformationFocusAreas < ActiveRecord::Migration
  def change
  	change_column :users, :personal_afformation_focus_areas, :string, array: true, default: []
  end
end
