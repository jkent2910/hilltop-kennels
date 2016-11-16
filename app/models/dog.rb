class Dog < ActiveRecord::Base
  has_and_belongs_to_many :daycare_days
  accepts_nested_attributes_for :daycare_days, reject_if: :all_blank, allow_destroy: true
end
