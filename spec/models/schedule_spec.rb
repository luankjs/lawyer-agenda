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
  it "is valid with valid attributes" do
    expect(build :schedule, :standard).to be_valid
  end

  it "is not valid without a adjudicating_part_code" do
    expect(build :schedule, :without_adjudicating_part_code).to_not be_valid
  end

  it "is not valid without a kind" do
    expect(build :schedule, :without_kind).to_not be_valid
  end

  it "is not valid without a number" do
    expect(build :schedule, :without_number).to_not be_valid
  end

  it "is not valid without a year" do
    expect(build :schedule, :without_year).to_not be_valid
  end

  it 'is not valid if kind is not "E" or "O"' do
    expect(build :schedule, :with_other_kind).to_not be_valid
  end

  it 'has composite_id in right format' do
    schedule = build :schedule, :standard
    expect(schedule.composite_id).to eq("405-2022-6-O")
  end
end
