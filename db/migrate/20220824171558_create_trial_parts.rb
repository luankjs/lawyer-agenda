class CreateTrialParts < ActiveRecord::Migration[6.0]
  def change
    create_table :trial_parts do |t|
      t.belongs_to :trial
      t.belongs_to :part
      t.integer :proxy_year
      t.integer :proxy_number
    end
  end
end
