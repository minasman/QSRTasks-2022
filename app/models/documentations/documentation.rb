class Documentation < ApplicationRecord
  belongs_to :organization
  belongs_to :store
  belongs_to :employee_named
  belongs_to :awarded_by
  belongs_to :position
  has_one :document
end
