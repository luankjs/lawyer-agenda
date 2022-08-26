class CreateJoinTablePartsLawyers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :parts, :lawyers do |t|
      # t.index [:part_id, :lawyer_id]
      # t.index [:lawyer_id, :part_id]
    end
  end
end
