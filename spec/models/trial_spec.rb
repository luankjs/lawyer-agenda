# == Schema Information
#
# Table name: trials
#
#  id         :bigint           not null, primary key
#  meta       :json
#  number     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe Trial, type: :model do
    it "is valid with valid attributes" do
        expect(build :trial).to be_valid
      end
    
      it "is not valid without a number" do
        expect(build :trial, :without_number).to_not be_valid
      end
end
