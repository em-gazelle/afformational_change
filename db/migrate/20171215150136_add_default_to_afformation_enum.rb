class AddDefaultToAfformationEnum < ActiveRecord::Migration
  def change
  	change_column_default :afformations, :afformation_focus_area, 0
  end
end
