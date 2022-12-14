# == Schema Information
#
# Table name: parts
#
#  id         :bigint           not null, primary key
#  code       :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Part < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :code
  has_many :trial_parts
  has_many :trials, through: :trial_parts
  has_and_belongs_to_many :lawyers
end
