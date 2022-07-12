class Organization < ApplicationRecord
  has_many :users, dependent: :delete_all
  has_many :positions, dependent: :delete_all
  has_many :stores, dependent: :delete_all
  has_many :vendors, dependent: :delete_all
  has_many :equipments, dependent: :delete_all
  has_many :equipment_areas, dependent: :delete_all
  has_many :equipment_types, dependent: :delete_all
  has_many :workorders, dependent: :delete_all
  has_many :safe_audits, dependent: :delete_all
  has_many :documents, dependent: :delete_all
  has_many :documentations, dependent: :delete_all
  has_many :rewards, dependent: :delete_all
end
