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
  pending "add some examples to (or delete) #{__FILE__}"
end
