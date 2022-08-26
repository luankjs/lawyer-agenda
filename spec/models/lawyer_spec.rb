# == Schema Information
#
# Table name: lawyers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Lawyer, type: :model do
  it "is valid with valid attributes"
  it "is not valid without a id"
  it "is not valid without a name"
  it "is not valid without a created_at"
  it "is not valid without a updated_at"
  it "is not valid if its name contains special chars"
end
