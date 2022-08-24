class Trial < ApplicationRecord
  has_and_belongs_to_many :schedules
  has_many :trial_parts
  has_many :parts, through: :trial_parts
end
