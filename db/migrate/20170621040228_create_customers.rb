class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email
      t.string :phone
      t.string :name
      t.string :timezone

      t.timestamps null: false
    end
  end
end
