class Lawyer < ApplicationRecord
  has_and_belongs_to_many :parts
end
