class SafeAudit < ApplicationRecord
  belongs_to :user
  belongs_to :store
  belongs_to :organization
end
