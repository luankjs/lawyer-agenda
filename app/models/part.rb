class Part < ApplicationRecord
  has_many :trial_parts
  has_many :trials, through: :trial_parts
  has_and_belongs_to_many :lawyers
end
