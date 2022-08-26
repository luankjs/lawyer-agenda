class CreateLawyers < ActiveRecord::Migration[6.0]
  def change
    create_table :lawyers do |t|
      t.string :name

      t.timestamps
    end
  end
end
