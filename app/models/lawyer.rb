# == Schema Information
#
# Table name: lawyers
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Lawyer < ApplicationRecord
  validates_presence_of :id
  validates_presence_of :name
  validates_presence_of :created_at
  validates_presence_of :updated_at
  validates_format_of :name, :with => /\A[^0-9`!@#\$%\^&*+_=]+\z/
  has_and_belongs_to_many :parts
end
