class RemoveExtraneousFields < ActiveRecord::Migration
  def change
  	remove_column :users, :personal_afformations_submitted
  	remove_column :afformations, :user_submitted_personal_afformation
  	remove_column :sent_afformations, :email_replied_to
  end
end
