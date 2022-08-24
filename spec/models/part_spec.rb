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
  pending "add some examples to (or delete) #{__FILE__}"
end
