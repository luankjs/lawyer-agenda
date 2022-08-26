# == Schema Information
#
# Table name: trials
#
#  id         :bigint           not null, primary key
#  meta       :json
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Trial < ApplicationRecord
  validates_presence_of :number
  has_and_belongs_to_many :schedules
  has_many :trial_parts
  has_many :parts, through: :trial_parts
end
