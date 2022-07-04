class EquipmentArea < ApplicationRecord
  belongs_to :organization
  has_many :equipment_types
  has_many :equipment, through: :equipment_types
  has_many :workorders
end
