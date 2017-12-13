class FixUserAfformationFocusAreas < ActiveRecord::Migration
  def change
  	remove_column :users, :personal_afformation_focus_areas
  	add_column :users, :personal_afformation_focus_area, :string, array: true, default: []
  end
end
