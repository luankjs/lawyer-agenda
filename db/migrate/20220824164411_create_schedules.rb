class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.integer :adjudicating_part_code
      t.string :number
      t.integer :year
      t.string :kind
      t.datetime :date
      t.datetime :published_at
      t.string :mode
      t.json :meta

      t.timestamps
    end
  end
end
