class CreateParts < ActiveRecord::Migration[6.0]
  def change
    create_table :parts do |t|
      t.integer :code
      t.string :name

      t.timestamps
    end
  end
end
