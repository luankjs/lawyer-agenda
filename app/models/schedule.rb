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
class Schedule < ApplicationRecord
  has_and_belongs_to_many :trials
end
