class CreateParts < ActiveRecord::Migration[5.0]
  def change
    create_table :parts do |t|
      t.string :name
      t.integer :number
      t.string :robot
      t.string :belongs_to

      t.timestamps
    end
  end
end
