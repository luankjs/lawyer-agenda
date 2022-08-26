class CreateJoinTableSchedulesTrials < ActiveRecord::Migration[6.0]
  def change
    create_join_table :schedules, :trials do |t|
      # t.index [:schedule_id, :trial_id]
      # t.index [:trial_id, :schedule_id]
    end
  end
end
