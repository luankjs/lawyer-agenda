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
    expect(build :part, :standard).to be_valid
  end

  it "is not valid without a id" do
    expect(build :part, :without_id).to_not be_valid
  end

  it "is not valid without a code" do
    expect(build :part, :without_code).to_not be_valid
  end

  it "is not valid without a name" do
    expect(build :part, :without_name).to_not be_valid
  end

  it "is not valid without a created_at" do
    expect(build :part, :without_created_at).to_not be_valid
  end

  it "is not valid without a updated_at" do
    expect(build :part, :without_updated_at).to_not be_valid
  end
end
