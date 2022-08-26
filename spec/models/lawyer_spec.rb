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
  it "is valid with valid attributes" do
    expect(build :lawyer).to be_valid
  end

  it "is not valid without a name" do
    expect(build :lawyer, :without_name).to_not be_valid
  end

  it "is not valid if its name contains special chars" do
    expect(build :lawyer, :uncomon_name).to_not be_valid
  end
end
