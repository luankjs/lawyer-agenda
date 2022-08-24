class Part < ApplicationRecord
  has_many :trial_parts
  has_many :trials, through: :trial_parts
end
