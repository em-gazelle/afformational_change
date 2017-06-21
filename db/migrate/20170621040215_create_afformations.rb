class CreateAfformations < ActiveRecord::Migration
  def change
    create_table :afformations do |t|
      t.string :afformation_text

      t.timestamps null: false
    end
  end
end
