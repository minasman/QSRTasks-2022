class SafeAudit < ApplicationRecord
  belongs_to :auditor, class_name: 'User'
  belongs_to :manager, class_name: 'User'
  belongs_to :store
  belongs_to :organization
end
