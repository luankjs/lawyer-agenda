# == Schema Information
#
# Table name: schedules
#
#  id                     :bigint           not null, primary key
#  adjudicating_part_code :integer
#  date                   :datetime
#  kind                   :string
#  meta                   :json
#  mode                   :string
#  number                 :string
#  published_at           :datetime
#  year                   :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
require 'rails_helper'

RSpec.describe Schedule, type: :model do
  it "is not valid without a id"
  it "is not valid without a adjudicating_part_code"
  it "is not valid without a date"
  it "is not valid without a kind"
  it "is not valid without a meta"
  it "is not valid without a mode"
  it "is not valid without a number"
  it "is not valid without a published_at"
  it "is not valid without a year"
  it "is not valid without a created_at"
  it "is not valid without a updated_at"
  it 'is not valid if kind is not "E" or "O"'
end
