class EquipmentArea < ApplicationRecord
  belongs_to :organization
  has_many :equipment_types
  has_many :equipments, through: :equipment_types

end
