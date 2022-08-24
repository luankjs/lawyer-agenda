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
  pending "add some examples to (or delete) #{__FILE__}"
end
