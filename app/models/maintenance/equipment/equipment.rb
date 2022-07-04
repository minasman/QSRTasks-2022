class Equipment < ApplicationRecord
  belongs_to :store
  belongs_to :equipment_type
  belongs_to :equipment_area
  belongs_to :organization

  def self.name_list=(list)
    @list = list
  end

  def self.name_list
    @list ||= {}
  end
end
