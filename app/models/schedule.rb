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
  validates_presence_of :adjudicating_part_code
  validates_presence_of :kind
  validates_presence_of :number
  validates_presence_of :year
  validates_format_of :kind, :with => /E|O/
  has_and_belongs_to_many :trials 

  def composite_id
    "#{adjudicating_part_code}-#{year}-#{number}-#{kind}"
  end
end
