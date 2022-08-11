class FoodSafetyAudit < ApplicationRecord
  belongs_to :store
  belongs_to :organization
  belongs_to :auditor, class_name: 'User'
  belongs_to :manager, class_name: 'User'
end
