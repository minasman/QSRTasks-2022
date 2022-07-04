class EquipmentType < ApplicationRecord
  belongs_to :equipment_area
  belongs_to :organization
  has_many :equipments

  def self.type_list=(list)
    @list = list
  end

  def self.type_list
    @list ||= {}
  end
end
