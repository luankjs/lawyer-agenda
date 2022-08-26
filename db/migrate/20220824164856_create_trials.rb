class CreateTrials < ActiveRecord::Migration[6.0]
  def change
    create_table :trials do |t|
      t.string :number
      t.json :meta

      t.timestamps
    end
  end
end
