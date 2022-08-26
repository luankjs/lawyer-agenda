# == Schema Information
#
# Table name: trial_parts
#
#  id           :bigint           not null, primary key
#  proxy_number :integer
#  proxy_year   :integer
#  part_id      :bigint
#  trial_id     :bigint
#
# Indexes
#
#  index_trial_parts_on_part_id   (part_id)
#  index_trial_parts_on_trial_id  (trial_id)
#
class TrialPart < ApplicationRecord
  belongs_to :trial
  belongs_to :part
end
