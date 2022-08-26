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
require 'rails_helper'

RSpec.describe Part, type: :model do
  it "is valid with valid attributes" do
    expect(build :part).to be_valid
  end

  it "is not valid without a code" do
    expect(build :part, :without_code).to_not be_valid
  end

  it "is not valid without a name" do
    expect(build :part, :without_name).to_not be_valid
  end
end
