class CreateTableUsersAfformations < ActiveRecord::Migration
  def change

	rename_table :customers, :users

    create_table :sent_afformations do |t|		
		t.datetime :email_replied_to_date
		t.boolean :email_replied_to
		t.text :user_response_to_afformation

		t.references :user, index: true, foreign_key: true
		t.references :afformation, index: true, foreign_key: true

		t.timestamps
    end

    add_column :users, :afformation_focus_areas, :integer, array: true
    add_column :users, :personal_afformations_submitted, :boolean
    add_column :users, :deactivated, :boolean

    add_column :afformations, :afformation_focus_area, :integer
    add_column :afformations, :user_submitted_personal_afformation, :boolean

    add_reference :afformations, :user, index: true, null: true
  end
end
