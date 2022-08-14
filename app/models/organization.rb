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
  has_many :new_hires, dependent: :delete_all
  has_many :curriculums, dependent: :delete_all
  has_many :shops, dependent: :delete_all
  has_many :wellnesses, dependent: :delete_all
  has_many :covid_statuses, dependent: :delete_all
  has_many :food_safety_audits, dependent: :delete_all
  has_many :food_handler_cards, dependent: :delete_all


end
